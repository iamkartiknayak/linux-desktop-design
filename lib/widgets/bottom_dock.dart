import 'package:flutter/material.dart';

import 'package:desktop_ui/common/dock_item.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class BottomDock extends StatelessWidget {
  const BottomDock({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 70,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8,
      ),
      margin: const EdgeInsets.only(bottom: 5),
      width: 410,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DockItem(
            child: Image.asset('assets/icons/chrome.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/finder.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/icloud.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/music.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/code.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/settings.png'),
          ),
          DockItem(
            child: Image.asset('assets/icons/bin.png'),
          ),
        ],
      ),
    );
  }
}
