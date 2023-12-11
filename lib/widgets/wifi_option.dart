import 'package:desktop_ui/providers/control_center_option_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:desktop_ui/constants.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class WifiOption extends StatelessWidget {
  const WifiOption({
    super.key,
    required this.isWifiOn,
    required this.onTap,
  });

  final bool isWifiOn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 80,
      width: 270,
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
                color:
                    isWifiOn ? Colors.blue : kDisabledControlCenterOptionColor,
              ),
              child: const Icon(
                Icons.wifi,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Wifi',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                isWifiOn
                    ? context
                        .watch<ControlCenterOptionStateProvider>()
                        .wifiState
                    : 'Off',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(15, 15, 20, 20),
            width: 0.5,
            color: Colors.grey,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isWifiOn
                    ? context
                        .watch<ControlCenterOptionStateProvider>()
                        .wifiSSIDState
                    : 'Not connected',
                style: TextStyle(
                  color: isWifiOn ? Colors.white : Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Transform.rotate(
                    angle: 1.5,
                    child: Icon(
                      FluentSystemIcons.ic_fluent_arrow_swap_regular,
                      color: isWifiOn ? Colors.white : Colors.grey,
                      size: 13,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    isWifiOn
                        ? context
                            .watch<ControlCenterOptionStateProvider>()
                            .wifiSpeedState
                        : '0MB/s',
                    style: TextStyle(
                      color: isWifiOn ? Colors.white : Colors.grey,
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
