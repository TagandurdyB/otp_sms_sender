import 'package:otp_sms_sender/config/core/exports.dart';

class EmptyWidget extends StatelessWidget {
  final Function()? onTap;
  final String? description;
  final IconData? iconD;
  const EmptyWidget({
    this.onTap,
    this.iconD,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // height: 70,
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconD != null)
            CircleWidget(
              rad: 80,
              child: Icon(iconD, size: 32),
            ),
          Text('ERROR!', style: TextStyle(fontSize: 32)),
          Visibility(
            visible: onTap != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: onTap,
                child: InCard(
                  pad: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'Try again',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
