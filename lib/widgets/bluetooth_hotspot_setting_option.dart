import 'package:flutter/material.dart';

import 'package:desktop_ui/common/acrylic_container.dart';

class BluetoothHotspotSettingsOption extends StatelessWidget {
  const BluetoothHotspotSettingsOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 80,
      width: 100,
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Icon(
            Icons.screenshot_monitor_outlined,
            color: Colors.white,
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
            width: 0.5,
            color: Colors.grey,
          ),
          const Icon(
            Icons.keyboard,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
