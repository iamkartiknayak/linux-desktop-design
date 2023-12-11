import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ControlCenterOptionStateProvider extends ChangeNotifier {
  bool _isControlCenterVisible = false;
  bool get isControlCenterVisible => _isControlCenterVisible;

  bool _isWifiOn = true;
  bool get isWifiOn => _isWifiOn;

  String _wifiState = 'Connected';
  String get wifiState => _wifiState;

  String _wifiSSIDState = 'FASTNET';
  String get wifiSSIDState => _wifiSSIDState;

  String _wifiSpeedState = '10KB/s';
  String get wifiSpeedState => _wifiSpeedState;

  bool _isWifiSpeedFluctuationsOn = false;

  bool _isDonotDisturbOn = false;
  bool get isDonotDisturbOn => _isDonotDisturbOn;

  bool _isBluetoothOn = true;
  bool get isBluetoothOn => _isBluetoothOn;

  bool _isHotspotOn = false;
  bool get isHotspotOn => _isHotspotOn;

  bool _isScreenMirroringOn = false;
  bool get isScreenMirroringOn => _isScreenMirroringOn;

  bool _isAirswapOn = true;
  bool get isAirswapOn => _isAirswapOn;

  void fluctuateWifiSpeed() {
    if (_isWifiSpeedFluctuationsOn) {
      return;
    }

    if (_wifiState == 'Connected') {
      Timer.periodic(
        const Duration(milliseconds: 2000),
        (timer) {
          final random = Random();
          final netSpeedValue = random.nextInt(700 - 1);
          if (netSpeedValue < 5) {
            _wifiSpeedState = '$netSpeedValue MB/s';
          } else {
            _wifiSpeedState = '$netSpeedValue KB/s';
          }
          notifyListeners();
        },
      );
    }
    _isWifiSpeedFluctuationsOn = true;
    notifyListeners();
  }

  void toggleControlCenterVisibility() {
    _isControlCenterVisible = !_isControlCenterVisible;
    notifyListeners();
  }

  void toggleWifi() {
    _isWifiOn = !_isWifiOn;

    if (_isWifiOn) {
      _wifiState = 'Connecting';
      _wifiSSIDState = '...';
      _wifiSpeedState = '0KB/s';
      Future.delayed(
        const Duration(seconds: 2),
        () {
          _wifiState = 'Connected';
          _wifiSSIDState = 'FASTNET';
          _wifiSpeedState = '126KB/s';
          notifyListeners();
        },
      );
    }
    notifyListeners();
  }

  void toggleDonotDisturb() {
    _isDonotDisturbOn = !_isDonotDisturbOn;
    notifyListeners();
  }

  void toggleBluetooth() {
    _isBluetoothOn = !_isBluetoothOn;
    notifyListeners();
  }

  void toggleHotspot() {
    _isHotspotOn = !_isHotspotOn;
    notifyListeners();
  }

  void toggleScreenMirror() {
    _isScreenMirroringOn = !_isScreenMirroringOn;
    notifyListeners();
  }

  void toggleAirswap() {
    _isAirswapOn = !_isAirswapOn;
    notifyListeners();
  }
}
