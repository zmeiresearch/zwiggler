import 'package:flutter/material.dart';

class StateProvider<T> extends StatefulWidget {
  final T initialValue;
  final Widget Function(
    BuildContext context,
    T value,
    void Function(T) setValue,
  ) builder;

  const StateProvider({
    Key? key,
    required this.builder,
    required this.initialValue,
  }) : super(key: key);

  @override
  _StateProviderState<T> createState() => _StateProviderState<T>();
}

class _StateProviderState<T> extends State<StateProvider<T>> {
  late T state;

  @override
  void initState() {
    super.initState();

    state = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(
      context,
      state,
      (T newValue) => setState(() => state = newValue),
    );
  }
}
