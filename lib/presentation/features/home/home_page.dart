import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:otp_sms_sender/config/core/exports.dart';
import 'package:otp_sms_sender/presentation/features/home/widgets/log_card.dart';

import 'widgets/my_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Dio _dio = Dio();
  Timer _timer = Timer(const Duration(milliseconds: 1000), () {});
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initSenders();
      refresher();
    });
    super.initState();
  }

  Future refresher() async {
    refresh();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) => refresher());
  }

  @override
  void dispose() {
    if (_timer.isActive) {
      _timer.cancel();
    }
    super.dispose();
  }

  Future refresh() async {
    setState(() {});
    // Boxes.openBoxes().then((value) {});
  }

  void initSenders() async {
    final deviceId = DeviceService.deviceId();
    final fcmToken = Boxes.fireToken ?? '';
    List<SenderEntity> senders = Boxes.senders.values.toList();
    if (senders.isEmpty) {
      if (MobileNumberService.simCards.isNotEmpty) {
        for (var sim in MobileNumberService.simCards) {
          final sender = SenderEntity(
            deviceId: deviceId,
            fcmToken: fcmToken,
            phone: sim.number ?? '???',
            simSlot: sim.slotIndex ?? -1,
            isEdit: false,
          );
          await Boxes.senders.put(sender.hashId, sender);
        }
        senders = Boxes.senders.values.toList();
      } else {
        await Go.to(Go.simCardEdit).then((_) {
          senders = Boxes.senders.values.toList();
        });
      }
    }
    for (var data in senders) {
      serdDataToServer(data);
    }
  }

  Future serdDataToServer(SenderEntity data) async {
    try {
      _dio.post(
        '${Boxes.domain}/api/devices',
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer C0PiTyxmgYhKeNd9Pt2z1UUkpPDoeG2A',
        }),
        data: data.toMap(),
      );
    } catch (e, s) {
      print('Error: $e ||||||||| $s');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LOGS"),
        centerTitle: true,
      ),
      drawer: const Drawer(child: MyDrawer()),
      body: ValueListenableBuilder(
          valueListenable: Boxes.logs.listenable(),
          builder: (context, box, child) {
            final values = box.values.toList().reversed.toList();
            return RefreshIndicator(
              onRefresh: refresh,
              child: values.isEmpty
                  ? const Center(
                      child: Text(
                      'No data!',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ))
                  : ListView.builder(
                      itemCount: values.length,
                      itemBuilder: (context, index) {
                        final value = values[index];
                        return Dismissible(
                          key: Key(value.hashId),
                          onResize: () {
                            Boxes.logs.delete(value.hashId);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(16),
                            child: const Icon(CupertinoIcons.trash),
                          ),
                          child: LogCard(obj: value),
                        );
                      },
                    ),
            );
          }),
    );
  }
}
