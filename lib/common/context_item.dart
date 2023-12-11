import 'package:flutter/material.dart';

class ContextItem extends StatefulWidget {
  const ContextItem({
    super.key,
    required this.leadingIcon,
    required this.label,
    this.trailing = const SizedBox.shrink(),
  });

  final IconData leadingIcon;
  final String label;
  final Widget trailing;

  @override
  State<ContextItem> createState() => _ContextItemState();
}

class _ContextItemState extends State<ContextItem> {
  bool isHovered = false;

  void handleHover(bool state) {
    setState(() {
      isHovered = state;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => handleHover(true),
      onExit: (_) => handleHover(false),
      child: InkWell(
// onTap: ()=> ,
        child: Container(
          color: isHovered ? Colors.white.withOpacity(0.2) : Colors.transparent,
          // padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
          child: Row(
            children: [
              Icon(
                widget.leadingIcon,
                color: Colors.white,
                size: 22,
              ),
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: const TextStyle(color: Colors.white),
              ),
              const Spacer(),
              widget.trailing,
            ],
          ),
        ),
      ),
    );
  }
}
