import 'package:flutter/material.dart';

import 'package:desktop_ui/common/acrylic_container.dart';

class DisplayBrightnessOption extends StatelessWidget {
  const DisplayBrightnessOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AcrylicContainer(
          height: 80,
          width: 355,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Display',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 25,
                    width: double.infinity,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 25,
                    width: 180,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 5, top: 2),
                    child: Icon(
                      Icons.brightness_6,
                      // color: Colors.grey,
                      size: 20,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const AcrylicContainer(
          height: 80,
          width: 75,
          // margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
          child: Icon(
            Icons.display_settings,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
