import 'package:desktop_ui/constants.dart';
import 'package:flutter/material.dart';

import 'package:desktop_ui/common/acrylic_container.dart';

class AirswapOption extends StatelessWidget {
  final bool isAirswapOn;
  final VoidCallback onTap;

  const AirswapOption({
    super.key,
    required this.isAirswapOn,
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
                color: isAirswapOn
                    ? Colors.blue
                    : kDisabledControlCenterOptionColor,
              ),
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                children: [
                  const Positioned(
                    top: 10,
                    left: 13,
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),
                  Positioned(
                    top: 15,
                    right: 12,
                    child: Transform.rotate(
                      angle: 3.1,
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 3),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Air Swap',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                isAirswapOn ? 'Everyone' : 'Off',
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
