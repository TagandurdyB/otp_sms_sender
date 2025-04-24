import 'package:flutter/material.dart';

class ScrollStyle extends StatelessWidget {
  final Color color;
  final Widget child;
  const ScrollStyle({
    this.color = Colors.orange,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior(),
      child: GlowingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        color: color,
        child: child,
      ),
    );
  }
}
