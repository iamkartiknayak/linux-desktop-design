import 'package:flutter/material.dart';

class DockItem extends StatefulWidget {
  const DockItem({super.key, required this.child});

  final Widget child;

  @override
  State<DockItem> createState() => _DockItemState();
}

class _DockItemState extends State<DockItem> {
  bool isHovered = false;

  void handleHover(bool state) {
    setState(() {
      isHovered = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => handleHover(true),
      onExit: (event) => handleHover(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: isHovered
            ? const EdgeInsets.symmetric(horizontal: 5.0)
            : const EdgeInsets.all(0),
        child: AnimatedScale(
          scale: isHovered ? 1.3 : 1,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}
