import 'package:flutter/material.dart';
import 'package:fluentui_icons/fluentui_icons.dart';

import 'package:desktop_ui/common/tag_circle.dart';
import 'package:desktop_ui/common/context_item.dart';
import 'package:desktop_ui/common/acrylic_container.dart';

class ContextMenu extends StatelessWidget {
  const ContextMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 200,
      left: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AcrylicContainer(
          height: 470,
          width: 250,
          sigmaX: 100,
          sigmaY: 100,
          child: Column(
            children: [
              const SizedBox(height: 10),
              const SizedBox(
                height: 35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FluentSystemIcons.ic_fluent_copy_regular,
                      color: Colors.white,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_cut_regular,
                      color: Colors.white,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_clipboard_paste_regular,
                      color: Colors.white,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_rename_regular,
                      color: Colors.white,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_delete_regular,
                      color: Colors.white,
                    ),
                    Icon(
                      FluentSystemIcons.ic_fluent_info_regular,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_image_regular,
                    label: 'Open',
                  ),
                  const ContextItem(
                    leadingIcon:
                        FluentSystemIcons.ic_fluent_open_in_browser_regular,
                    label: 'Open with',
                    trailing: Icon(
                      FluentSystemIcons.ic_fluent_chevron_right_regular,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_wallpaper_regular,
                    label: 'Set as background',
                  ),
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_star_regular,
                    label: 'Add to favorites',
                  ),
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_link_regular,
                    label: 'Copy as path',
                  ),
                  const ContextItem(
                    leadingIcon: Icons.terminal_outlined,
                    label: 'Open in terminal',
                  ),
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_add_circle_regular,
                    label: 'New',
                    trailing: Icon(
                      FluentSystemIcons.ic_fluent_chevron_right_regular,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  const ContextItem(
                    leadingIcon: FluentSystemIcons.ic_fluent_folder_zip_regular,
                    label: 'Compress as',
                    trailing: Icon(
                      FluentSystemIcons.ic_fluent_chevron_right_regular,
                      size: 22,
                      color: Colors.white,
                    ),
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(0.2),
                    height: 0,
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Tags',
                          style: TextStyle(color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TagCircle(color: Colors.red),
                            TagCircle(color: Colors.green),
                            TagCircle(color: Colors.blue),
                            TagCircle(color: Colors.purple),
                            TagCircle(color: Colors.yellow),
                            SizedBox(width: 20)
                          ],
                        ),
                        const SizedBox(height: 10),
                        Divider(
                          color: Colors.grey.withOpacity(0.2),
                          height: 0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  const ContextItem(
                    leadingIcon: Icons.info_outline,
                    label: 'Properties',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
