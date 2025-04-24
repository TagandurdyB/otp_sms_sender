import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final Color? col;
  final double rad;
  final double borderW;
  final Color borderC;
  final Widget? child;
  final EdgeInsetsGeometry? pad;
  final Alignment align;
  const CircleWidget({
    this.col = Colors.grey,
    this.rad = 24,
    this.borderW = 0,
    this.borderC = Colors.transparent,
    this.child,
    this.pad,
    this.align=Alignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: pad,
      width: rad,
      height: rad,
      alignment: align,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: col,
        borderRadius: BorderRadius.circular(rad * 0.5),
        border: Border.all(color: borderC, width: borderW),
      ),
      child: child,
    );
  }
}
