import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'state_provider.dart';

void main() {
  runApp(ZWigglerApp());
}

class ZWigglerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialTheme = ThemeData(
      cupertinoOverrideTheme: CupertinoThemeData(
        primaryColor: Color(0xff127EFB),
      ),
      primarySwatch: Colors.green,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
          foregroundColor: MaterialStateProperty.all(Color(0xFF3DDC84)),
        ),
      ),
    );

    return Theme(
      data: materialTheme,
      child: PlatformProvider(
        settings: PlatformSettingsData(iosUsesMaterialWidgets: true),
        builder: (context) => PlatformApp(
          localizationsDelegates: <LocalizationsDelegate<dynamic>>[
            DefaultMaterialLocalizations.delegate,
            DefaultWidgetsLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          title: 'Flutter Platform Widgets',
          home: PlatformPage(),
          material: (_, __) => MaterialAppData(
            theme: materialTheme,
          ),
          cupertino: (_, __) => CupertinoAppData(
            theme: CupertinoThemeData(
              primaryColor: Color(0xff127EFB),
            ),
          ),
        ),
      ),
    );
  }
}

class PlatformPage extends StatelessWidget {
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

_showDatePicker(BuildContext context) async {
  final now = DateUtils.dateOnly(DateTime.now());
  final date = await showPlatformDatePicker(
    context: context,
    firstDate: now.subtract(const Duration(days: 100)),
    lastDate: now.add(const Duration(days: 100)),
    initialDate: now,
  );

  if (date != null) {
    _showExampleDialog(context, 'Date: $date');
  }
}

_showExampleDialog(BuildContext context, String text) {
  showPlatformDialog(
    context: context,
    builder: (_) => PlatformAlertDialog(
      title: Text('Alert'),
      content: Text('$text content'),
      actions: <Widget>[
        PlatformDialogAction(
          material: (_, __) => MaterialDialogActionData(),
          cupertino: (_, __) => CupertinoDialogActionData(),
          child: PlatformText('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
        PlatformDialogAction(
          child: PlatformText('OK'),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    ),
  );
}




