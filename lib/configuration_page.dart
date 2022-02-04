import 'package:flutter/material.dart';

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
                initialValue: 30,
                minValue: 5,
                maxValue: 120)),
        Padding(
            padding: EdgeInsets.all(16.0),
            child: SliderGroup(
                title: "Movement period (sec)",
                initialValue: 60,
                minValue: 30,
                divisions: 9,
                maxValue: 300)),
      ],
    );
  }
}
