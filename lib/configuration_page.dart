import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'slider_group.dart'

class AppMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text('zWiggler config'),
        ),
        body: ListView(children: [
          SliderGroup(
            title: "Test Slider: ",
            initialValue: 10,
            minValue: 5,
            maxValue: 20,
            divisions: 3,
          ),
        ]));
  }
}