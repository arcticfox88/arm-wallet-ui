
import 'package:flutter/widgets.dart';

import 'rx_value.dart';

typedef WidgetReBuilder<T> = Widget Function(BuildContext context, T value);

class Rb<T> extends StatefulWidget {

  const Rb({
    super.key,
    required this.bind,
    required this.builder,
  });

  final RxValue<T> bind;

  final WidgetReBuilder<T> builder;

  @override
  State<StatefulWidget> createState() => _RbState<T>();
}

class _RbState<T> extends State<Rb<T>> {
  late T value;

  @override
  void initState() {
    super.initState();
    value = widget.bind.value;
    widget.bind.addListener(_valueChanged);
  }

  @override
  void didUpdateWidget(Rb<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.bind != widget.bind) {
      oldWidget.bind.removeListener(_valueChanged);
      value = widget.bind.value;
      widget.bind.addListener(_valueChanged);
    }
  }

  @override
  void dispose() {
    widget.bind.removeListener(_valueChanged);
    super.dispose();
  }

  void _valueChanged() {
    setState(() { value = widget.bind.value; });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, value);
  }
}