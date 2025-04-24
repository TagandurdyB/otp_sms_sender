import 'package:flutter/cupertino.dart';
import 'package:otp_sms_sender/config/core/exports.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  TextEditingController _domainController = TextEditingController();

  @override
  void initState() {
    _domainController = TextEditingController(text: Boxes.domain);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _domainController,
                decoration: const InputDecoration(
                  labelText: 'Domain address',
                  hintText: 'https://....',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  Boxes.putDomain(_domainController.text);
                },
              ),
            ),
            const Divider(color: Colors.white),
            buildMenuBtn(
              'Send SMS',
              iconD: Icons.schedule_send_outlined,
              func: () {
                Go.to(Go.sendSms);
              },
            ),
            buildMenuBtn(
              'Add New SIM',
              iconD: Icons.add_circle_sharp,
              func: () {
                Go.to(Go.simCardEdit);
              },
            ),
            const Divider(color: Colors.white),
            ValueListenableBuilder(
                valueListenable: Boxes.senders.listenable(),
                builder: (context, box, child) {
                  final values = box.values.toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      values.length,
                      (index) {
                        final sim = values[index];
                        return Dismissible(
                          key: Key(sim.hashId),
                          onResize: () {
                            Boxes.senders.delete(sim.hashId);
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(16),
                            child: const Icon(CupertinoIcons.trash),
                          ),
                          child: buildMenuBtn(
                            'SIM CARD ${sim.simSlot}',
                            iconD: Icons.sim_card_outlined,
                            subTitle: sim.phone,
                            func: () {
                              Go.to(Go.simCardEdit, argument: {'sender': sim});
                            },
                          ),
                        );
                      },
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget buildMenuBtn(
    String text, {
    Function()? func,
    IconData? iconD,
    String? subTitle,
  }) {
    return MaterialButton(
      onPressed: func,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                if (subTitle != null)
                  Text(
                    subTitle,
                    style: TextStyle(color: Colors.grey[400], fontSize: 12),
                  ),
              ],
            ),
          ),
          Icon(
            iconD,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
