import 'package:flutter/material.dart';

class MyCont extends Container {
  MyCont(
      {Widget? ch,
      EdgeInsetsGeometry? pad,
      EdgeInsetsGeometry? marg,
      double? w,
      double? h,
      AlignmentGeometry? alig,
      Color? col,
      List<Color>? colors,
      double rad = 0,
      double? radTL,
      double? radTR,
      double? radBL,
      double? radBR,
      List<BoxShadow>? shadows,
      AlignmentGeometry colorsBegin = Alignment.centerLeft,
      AlignmentGeometry colorsEnd = Alignment.centerRight,
      Clip clip = Clip.none,
      double? borderW,
      Color borderC = Colors.grey,
      List<double>? stops,
      super.key})
      : super(
          child: ch,
          clipBehavior: clip,
          width: w,
          height: h,
          padding: pad,
          margin: marg,
          alignment: alig,
          decoration: BoxDecoration(
            color: colors == null ? col : null,
            gradient: colors != null
                ? LinearGradient(
                    colors: colors,
                    stops: stops,
                    begin: colorsBegin,
                    end: colorsEnd)
                : null,
            boxShadow: shadows,
            borderRadius: rad != 0
                ? BorderRadius.circular(rad)
                : BorderRadius.only(
                    topLeft: Radius.circular(radTL ?? 0),
                    topRight: Radius.circular(radTR ?? 0),
                    bottomLeft: Radius.circular(radBL ?? 0),
                    bottomRight: Radius.circular(radBR ?? 0),
                  ),
            border: borderW != null
                ? Border.all(width: borderW, color: borderC)
                : null,
          ),
        );
}
