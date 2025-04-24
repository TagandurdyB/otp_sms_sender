// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:otp_sms_sender/config/core/exports.dart';

class SimCardEditPage extends StatefulWidget {
  SenderEntity? sender;
  SimCardEditPage({
    super.key,
    this.sender,
  });

  @override
  State<SimCardEditPage> createState() => _SimCardEditPageState();
}

class _SimCardEditPageState extends State<SimCardEditPage> {
  late final TextEditingController _phoneControl =
      TextEditingController(text: widget.sender?.phone);
  late final TextEditingController _slotControl =
      TextEditingController(text: "${widget.sender?.simSlot ?? '0'}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIM Card"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _phoneControl,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                hintText: '+...',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _slotControl,
              decoration: const InputDecoration(
                labelText: 'Slot Index',
                border: OutlineInputBorder(),
              ),
              keyboardType: const TextInputType.numberWithOptions(
                decimal: false,
                signed: false,
              ),
            ),
            const SizedBox(height: 16),
            MaterialButton(
              onPressed: () {
                final deviceId = DeviceService.deviceId();
                final fcmToken = Boxes.fireToken ?? '';
                final sender = widget.sender?.copyWith(
                      phone: _phoneControl.text,
                      simSlot: int.tryParse(_slotControl.text),
                    ) ??
                    SenderModel(
                      deviceId: deviceId,
                      fcmToken: fcmToken,
                      phone: _phoneControl.text,
                      simSlot: int.tryParse(_slotControl.text),
                    );
                Boxes.senders.put(sender.hashId, sender);
                Go.pop(args: [sender]);
              },
              color: Colors.blue,
              child: const Text(
                'SAVE',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
