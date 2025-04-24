import 'package:flutter/material.dart';

class InCard extends StatelessWidget {
  final Widget child;
  final double? w;
  final double? h;
  final Color? col;
  final double rad;
  final Alignment? align;
  final EdgeInsetsGeometry? pad;
  final BoxBorder? border;
  const InCard(
      {required this.child,
      this.pad = const EdgeInsets.all(16),
      this.w,
      this.rad = 8,
      this.col,
      this.h,
      this.border,
      this.align,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rad),
        color: col ?? Theme.of(context).canvasColor,
        border: border,
      ),
      width: w,
      height: h,
      padding: pad,
      child: child,
    );
  }
}
