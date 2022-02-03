import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import 'slider_group.dart';

class ConfigurationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
            padding: EdgeInsets.all(16.0),
            child: SliderGroup(
                title: "Activity Time (min)",
                initialValue: 20,
                minValue: 5,
                maxValue: 1500)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: SliderGroup(
                title: "Movement period (sec)",
                initialValue: 60,
                minValue: 10,
                maxValue: 300)),
      ],
    );
  }
}
