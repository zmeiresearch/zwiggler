import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:system_tray/system_tray.dart';

import 'app_window.dart';

class TrayMenu extends StatefulWidget {
  const TrayMenu({Key? key}) : super(key: key);

  @override
  State<TrayMenu> createState() => _TrayMenuState();
}

class _TrayMenuState extends State<TrayMenu> {
  final SystemTray _systemTray = SystemTray();
  final AppWindow _appWindow = AppWindow();

  @override
  void initState() {
    super.initState();
    initTrayMenu();
  }

  @override
  Widget build(BuildContext context) {
    return WigglerAppWindow();
  }

  Future<void> initTrayMenu() async {
    String path =
        Platform.isWindows ? 'assets/app_icon.ico' : 'assets/app_icon.png';
    if (Platform.isMacOS) {
      path = 'AppIcon';
    }

    void _toggleActive() {}

    void _exitApp() {}

    final menu = [
      MenuItem(label: "Show", onClicked: _appWindow.show),
      MenuItem(label: "Active", onClicked: _toggleActive),
      MenuItem(label: "Exit", onClicked: _exitApp)
    ];

    // We first init the systray menu and then add the menu entries
    await _systemTray.initSystemTray(
      title: "system tray",
      iconPath: path,
      toolTip: "How to use system tray with Flutter",
    );

    await _systemTray.setContextMenu(menu);

    // handle system tray event
    _systemTray.registerSystemTrayEventHandler((eventName) {
      debugPrint("eventName: $eventName");
      if (eventName == "leftMouseDown") {
      } else if (eventName == "leftMouseUp") {
        _appWindow.show();
      } else if (eventName == "rightMouseDown") {
      } else if (eventName == "rightMouseUp") {
        _systemTray.popUpContextMenu();
      }
    });
  }
}

const backgroundStartColor = Color(0xFFFFD500);
const backgroundEndColor = Color(0xFFF6A00C);

class LeftSide extends StatelessWidget {
  const LeftSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [backgroundStartColor, backgroundEndColor],
                    stops: [0.0, 1.0]),
              ),
              child: Text("asdasd"),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ),
      ),
    );
  }
}

class RightSide extends StatelessWidget {
  const RightSide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: const Color(0xFFFFFFFF),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [backgroundStartColor, backgroundEndColor],
                    stops: [0.0, 1.0]),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text("12312312"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
