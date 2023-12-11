import 'dart:ui';

import 'package:flutter/material.dart';

class AcrylicContainer extends StatelessWidget {
  const AcrylicContainer({
    super.key,
    required this.height,
    this.width = double.maxFinite,
    this.sigmaX = 0,
    this.sigmaY = 0,
    this.child = const SizedBox.shrink(),
    this.padding = const EdgeInsets.all(0),
    this.margin = const EdgeInsets.all(0),
    this.hasRoundedBorders = true,
    this.onTap,
  });

  final double height;
  final double width;
  final double sigmaX;
  final double sigmaY;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final bool hasRoundedBorders;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: sigmaX,
            sigmaY: sigmaY,
          ),
          child: Container(
            height: height,
            width: width,
            padding: padding,
            margin: margin,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              borderRadius:
                  hasRoundedBorders ? BorderRadius.circular(16) : null,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
