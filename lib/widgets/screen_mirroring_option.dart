import 'package:flutter/material.dart';

import 'package:desktop_ui/constants.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class ScreenMirroringOption extends StatelessWidget {
  final bool isScreenMirroringOn;
  final VoidCallback onTap;

  const ScreenMirroringOption({
    super.key,
    required this.isScreenMirroringOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 80,
      width: 160,
      onTap: onTap,
      child: Row(
        children: [
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: 40,
              width: 40,
              margin: const EdgeInsets.fromLTRB(15, 10, 10, 10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isScreenMirroringOn
                    ? Colors.blue
                    : kDisabledControlCenterOptionColor,
              ),
              child: Transform.rotate(
                angle: -0.7,
                child: const Icon(
                  Icons.photo_size_select_large_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 3),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Screen mirroring',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
