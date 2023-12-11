// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:desktop_ui/providers/control_center_option_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:desktop_ui/widgets/air_swap.dart';
import 'package:desktop_ui/widgets/wifi_option.dart';
import 'package:desktop_ui/widgets/media_option.dart';
import 'package:desktop_ui/widgets/hotspot_option.dart';
import 'package:desktop_ui/widgets/bluetooth_option.dart';
import 'package:desktop_ui/common/acrylic_container.dart';
import 'package:desktop_ui/widgets/donot_disturb_option.dart';
import 'package:desktop_ui/widgets/screen_mirroring_option.dart';
import 'package:desktop_ui/widgets/display_brightness_option.dart';
import 'package:desktop_ui/widgets/settings_accessibility_option.dart';
import 'package:desktop_ui/widgets/bluetooth_hotspot_setting_option.dart';

class ControlCenter extends StatelessWidget {
  const ControlCenter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ControlCenterOptionStateProvider>().fluctuateWifiSpeed();

    return AcrylicContainer(
      // height: 380,
      height: 470,
      width: 470,
      sigmaX: 15,
      sigmaY: 15,
      margin: EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WifiOption(
                isWifiOn:
                    context.watch<ControlCenterOptionStateProvider>().isWifiOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleWifi(),
              ),
              SizedBox(width: 10),
              DonotDisturbOption(
                isDonotDisturbOn: context
                    .watch<ControlCenterOptionStateProvider>()
                    .isDonotDisturbOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleDonotDisturb(),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BluetoothOption(
                isBluetoothOn: context
                    .watch<ControlCenterOptionStateProvider>()
                    .isBluetoothOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleBluetooth(),
              ),
              HotspotOption(
                isHotspotOn: context
                    .watch<ControlCenterOptionStateProvider>()
                    .isHotspotOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleHotspot(),
              ),
              BluetoothHotspotSettingsOption(),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScreenMirroringOption(
                isScreenMirroringOn: context
                    .watch<ControlCenterOptionStateProvider>()
                    .isScreenMirroringOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleScreenMirror(),
              ),
              AirswapOption(
                isAirswapOn: context
                    .watch<ControlCenterOptionStateProvider>()
                    .isAirswapOn,
                onTap: () => context
                    .read<ControlCenterOptionStateProvider>()
                    .toggleAirswap(),
              ),
              SettingsAccessibilityOption()
            ],
          ),
          SizedBox(height: 10),
          DisplayBrightnessOption(),
          SizedBox(height: 10),
          MediaOption()
        ],
      ),
    );
  }
}
