import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  final double? w, h, progres;
  final Color? color;
  const LoadingWidget({
    this.w,
    this.h=70,
    this.progres,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: w,
          height: h,
          child: Center(
            child: CircularProgressIndicator(
              value: progres,
              color: color,
            ),
            // child: Lottie.asset(Asset.lLoading),
          )),
    );
  }
}
