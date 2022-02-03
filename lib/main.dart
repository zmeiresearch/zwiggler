import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:desktop_window/desktop_window.dart';

import 'state_provider.dart';
import 'configuration_page.dart';
import 'slider_group.dart';

void main() {
  runApp(ZWigglerApp());
}

class ZWigglerApp extends StatefulWidget {
  final materialTheme = ThemeData(
    primarySwatch: Colors.blue,
  );

  // Force light theme as text in dark mode is not rendered correctly,
  // at least in flutter 2.8.1
  final cupertinoTheme = CupertinoThemeData(brightness: Brightness.light);

  @override
  State<ZWigglerApp> createState() => _ZWigglerAppState();
}

class _ZWigglerAppState extends State<ZWigglerApp> {
  late Size _windowSize;

  Future _setWindowSize() async {
    const appSize = Size(500, 300);
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

class PlatformPageDefault extends StatelessWidget {
  var sliderValue = 50.0;
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      appBar: PlatformAppBar(
        title: Text('Flutter Platform Widgets'),
      ),
      body: ListView(
        children: [
          Divider(thickness: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PlatformElevatedButton(
                child: PlatformText('Change Platform'),
                onPressed: () {
                  final p = PlatformProvider.of(context)!;

                  isMaterial(context)
                      ? p.changeToCupertinoPlatform()
                      : p.changeToMaterialPlatform();
                }),
          ),
          Divider(thickness: 10),

          SliderGroup(
              title: "Test Slider: ",
              initialValue: 10,
              minValue: 5,
              maxValue: 20),

          Divider(thickness: 10),

          PlatformText(
            'asdf Text',
            textAlign: TextAlign.center,
          ),
          PlatformElevatedButton(
            child: Text("adsasdadasda"),
            onPressed: () => print('dfge PlatformButton'),
            padding: const EdgeInsets.all(8),
          ),
          PlatformElevatedButton(
            child: Text("123123fxczcvxcv"),
            onPressed: () => print('12312 PlatformButton'),
            padding: const EdgeInsets.all(8),
            material: (_, __) => MaterialElevatedButtonData(
              icon: Icon(Icons.home),
            ),
            cupertino: (_, __) => CupertinoElevatedButtonData(
              originalStyle: true,
            ),
          ),
          // ! PlatformTextButton
          PlatformTextButton(
            child: Text("123123asdasda"),
            onPressed: () => print('34534 PlatformButton'),
            padding: const EdgeInsets.all(8),
          ),
          StateProvider<bool>(
            initialValue: false,
            builder: (_, value, setValue) => PlatformSwitch(
              onChanged: setValue,
              value: value,
            ),
          ),
          // ! PlatformSlider
          StateProvider<double>(
            initialValue: 0.5,
            builder: (_, value, setValue) => PlatformSlider(
              onChanged: setValue,
              value: value,
            ),
          ),
          // ! PlatformTextField
          PlatformTextField(hintText: "HintText"),

          // ! Popup Menu
          PlatformPopupMenu(
            icon: Icon(
              context.platformIcon(
                material: Icons.more_vert_rounded,
                cupertino: CupertinoIcons.ellipsis,
              ),
            ),
            options: [
              PopupMenuOption(label: 'One'),
              PopupMenuOption(label: 'Two'),
              PopupMenuOption(label: 'Three'),
            ],
          ),
        ],
      ),
    );
  }
}
