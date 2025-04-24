// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:otp_sms_sender/config/core/exports.dart';

class LogCard extends StatelessWidget {
  final LogEntity obj;
  const LogCard({
    super.key,
    required this.obj,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            obj.hashId,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      obj.phone,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      obj.message,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              InCard(
                col: Colors.orange[900]!,
                rad: 12,
                pad: const EdgeInsets.fromLTRB(16, 4, 16, 4),
                child: Text(
                  obj.otp,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
