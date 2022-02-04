import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class SliderGroup extends StatefulWidget {
  final String title;
  final int initialValue;
  final int minValue;
  final int maxValue;
  final int? divisions;

  const SliderGroup(
      {Key? key,
      required this.title,
      required this.initialValue,
      required this.minValue,
      required this.maxValue,
      this.divisions})
      : super(key: key);

  @override
  State<SliderGroup> createState() => _SliderGroupState();
}

class _SliderGroupState extends State<SliderGroup> {
  late double _value;

  @override
  void initState() {
    super.initState();

    _value = widget.initialValue.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        //decoration: BoxDecoration(
        //    border: Border.all(),
        //    borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Center(
                      child: PlatformText(
                    widget.title,
                    textAlign: TextAlign.center,
                  )),
                  flex: 2,
                ),
                Expanded(
                  child: Center(
                    // CupertinoSlider does not support divisions(2.8.1)
                    child: Slider(
                      value: _value.toDouble(),
                      min: widget.minValue.toDouble(),
                      max: widget.maxValue.toDouble(),
                      divisions: widget.divisions,
                      label: "$_value",
                      onChanged: (double newValue) {
                        setState(() => _value = newValue);
                      },
                    ),
                  ),
                  flex: 7,
                ),
                Expanded(
                  child: Center(child: Text(_value.round().toString())),
                  flex: 1,
                ),
              ],
            )));
  }
}
