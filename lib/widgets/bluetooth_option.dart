import 'package:flutter/material.dart';

import 'package:desktop_ui/common/acrylic_container.dart';

class BluetoothOption extends StatelessWidget {
  final bool isBluetoothOn;
  final VoidCallback onTap;

  const BluetoothOption({
    super.key,
    required this.isBluetoothOn,
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
                color:
                    isBluetoothOn ? Colors.blue : Colors.grey.withOpacity(0.2),
              ),
              child: Icon(
                isBluetoothOn ? Icons.bluetooth_searching : Icons.bluetooth,
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
                'Bluetooth',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                isBluetoothOn ? 'Pair mode' : 'Off',
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
