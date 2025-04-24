// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:otp_sms_sender/config/core/exports.dart';

class SendSmsPage extends StatefulWidget {
  const SendSmsPage({
    super.key,
  });

  @override
  State<SendSmsPage> createState() => _SendSmsPageState();
}

class _SendSmsPageState extends State<SendSmsPage> {
  late final TextEditingController _phoneControl = TextEditingController();
  late final TextEditingController _message = TextEditingController();
  late final TextEditingController _slotControl =
      TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Send SMS"),
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
              controller: _message,
              decoration: const InputDecoration(
                labelText: 'Message',
                hintText: 'Content...',
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
                SmsSenderBgService.sendSms(
                  _phoneControl.text,
                  _message.text,
                  simSlot:( int.tryParse(_slotControl.text)??0) +1,
                );
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
