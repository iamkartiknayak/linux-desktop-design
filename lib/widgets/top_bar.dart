import 'dart:async';

import 'package:desktop_ui/providers/control_center_option_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

import 'package:desktop_ui/common/acrylic_container.dart';

class TopBar extends StatefulWidget {
  const TopBar({
    super.key,
  });

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  String formattedData = '';

  @override
  void initState() {
    super.initState();
    getCurrentFormattedDate();
  }

  void getCurrentFormattedDate() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      final now = DateTime.now();
      final formatter = DateFormat('E MMM d h:mm:ss a');
      setState(() {
        formattedData = formatter.format(now);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AcrylicContainer(
      height: 35,
      sigmaX: 15,
      sigmaY: 15,
      hasRoundedBorders: false,
      child: Row(
        children: [
          const SizedBox(width: 10),
          const Icon(
            Icons.api_sharp,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 18),
          const Text(
            'File',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            'Edit',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            'View',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            'Window',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 18),
          const Text(
            'Help',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const SizedBox(width: 18),
          const Icon(
            FluentSystemIcons.ic_fluent_battery_4_regular,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 20),
          Icon(
            context.watch<ControlCenterOptionStateProvider>().isWifiOn
                ? context.watch<ControlCenterOptionStateProvider>().wifiState ==
                        'Connected'
                    ? Icons.wifi_2_bar_outlined
                    : Icons.wifi_find_outlined
                : Icons.wifi_off,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 20),
          const Icon(
            FluentSystemIcons.ic_fluent_search_regular,
            color: Colors.white,
            size: 20,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => context
                .read<ControlCenterOptionStateProvider>()
                .toggleControlCenterVisibility(),
            child: const Icon(
              FluentSystemIcons.ic_fluent_settings_dev_regular,
              color: Colors.white,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            formattedData,
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }
}
