import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:desktop_ui/widgets/top_bar.dart';
import 'package:desktop_ui/widgets/bottom_dock.dart';
import 'package:desktop_ui/widgets/context_menu.dart';
import 'package:desktop_ui/widgets/control_center.dart';
import 'package:desktop_ui/providers/control_center_option_state_provider.dart';

void main() => runApp(const DesktopUI());

class DesktopUI extends StatefulWidget {
  const DesktopUI({super.key});

  @override
  State<DesktopUI> createState() => _DesktopUIState();
}

class _DesktopUIState extends State<DesktopUI> {
  late OverlayEntry _overlayEntry;

  void _showContextMenu(Offset position, BuildContext context) {
    try {
      _overlayEntry.remove();
    } catch (e) {
      debugPrint(e.toString());
    }

    _overlayEntry = _createOverlayEntry(position);

    Overlay.of(context).insert(_overlayEntry);
  }

  OverlayEntry _createOverlayEntry(Offset position) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy,
        child: const Material(
          color: Colors.transparent,
          child: ContextMenu(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ControlCenterOptionStateProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Builder(builder: (context) {
            return GestureDetector(
              onSecondaryTapUp: (details) {
                _showContextMenu(details.globalPosition, context);
              },
              onTap: () {
                try {
                  _overlayEntry.remove();
                } catch (e) {
                  debugPrint(e.toString());
                }
                final isControlCenterVisible = context
                    .read<ControlCenterOptionStateProvider>()
                    .isControlCenterVisible;
                if (isControlCenterVisible) {
                  context
                      .read<ControlCenterOptionStateProvider>()
                      .toggleControlCenterVisibility();
                }
              },
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/image2.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      const TopBar(),
                      const SizedBox(height: 12),
                      context
                              .watch<ControlCenterOptionStateProvider>()
                              .isControlCenterVisible
                          ? const Align(
                              alignment: Alignment.topRight,
                              child: ControlCenter(),
                            )
                          : const SizedBox.shrink(),
                      const Spacer(),
                      const BottomDock(),
                    ],
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
