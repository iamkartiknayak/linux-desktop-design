import 'package:flutter/material.dart';

import 'package:desktop_ui/constants.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class DonotDisturbOption extends StatelessWidget {
  final bool isDonotDisturbOn;
  final VoidCallback onTap;

  const DonotDisturbOption({
    super.key,
    required this.isDonotDisturbOn,
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
                color: isDonotDisturbOn
                    ? Colors.blue
                    : kDisabledControlCenterOptionColor,
              ),
              child: Transform.rotate(
                angle: -0.7,
                child: const Icon(
                  Icons.nightlight,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Do not disturb',
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
