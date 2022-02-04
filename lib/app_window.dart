import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:desktop_window/desktop_window.dart';

import 'configuration_page.dart';

class WigglerAppWindow extends StatefulWidget {
  final materialTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  // Force light theme as text in dark mode is not rendered correctly,
  // at least in flutter 2.8.1
  final cupertinoTheme = const CupertinoThemeData(
      brightness: Brightness.light, scaffoldBackgroundColor: Color(0xfff0f0f0));

  WigglerAppWindow({Key? key}) : super(key: key);

  @override
  State<WigglerAppWindow> createState() => _WigglerAppState();
}

class _WigglerAppState extends State<WigglerAppWindow> {
  Future _setWindowSize() async {
    const appSize = Size(500, 200);
    DesktopWindow.setMinWindowSize(appSize);
    DesktopWindow.setMaxWindowSize(appSize);
    DesktopWindow.setWindowSize(appSize);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _setWindowSize();
    return Theme(
      data: widget.materialTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          title: 'Flutter Platform Widgets',
          debugShowCheckedModeBanner: false,
          //home: PlatformPageDefault(),
          home: PlatformScaffold(body: ConfigurationPage()),
          material: (_, __) => MaterialAppData(
            theme: widget.materialTheme,
          ),
          cupertino: (_, __) => CupertinoAppData(
            theme: widget.cupertinoTheme,
          ),
        ),
      ),
    );
  }
}
