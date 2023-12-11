import 'package:flutter/material.dart';

import 'package:desktop_ui/constants.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class HotspotOption extends StatelessWidget {
  final bool isHotspotOn;
  final VoidCallback onTap;

  const HotspotOption({
    super.key,
    required this.isHotspotOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 80,
      width: 160,
      onTap: onTap,
      margin: const EdgeInsets.only(left: 10),
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
                color: isHotspotOn
                    ? Colors.blue
                    : kDisabledControlCenterOptionColor,
              ),
              child: const Icon(
                Icons.wifi_tethering,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 2),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hotspot',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                isHotspotOn ? 'Discoverable' : 'Off',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
