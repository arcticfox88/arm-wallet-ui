import 'package:flutter/material.dart';

import '../../../../theme/color.dart';
import 'custom_tab_indicator.dart';

class CustomTabBar extends StatefulWidget {
  final List<String> labels;
  final TextStyle? labelStyle;
  final TextStyle? selectedStyle;
  final int index;
  final ValueChanged<int>? onChanged;

  const CustomTabBar(
      {Key? key,
      required this.labels,
      TextStyle? labelStyle,
      TextStyle? selectedStyle,
      this.onChanged,
      this.index = 0})
      : labelStyle = labelStyle ??
            const TextStyle(fontSize: 16, color: notSelectedText, height: 1.0),
        selectedStyle = selectedStyle ??
            const TextStyle(fontSize: 20, color: primaryText, height: 1.0),
        super(key: key);

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int currentIndex = 0;

  _onChange(int i) {
    setState(() {
      currentIndex = i;
    });
    widget.onChanged?.call(currentIndex);
  }

  @override
  void initState() {
    currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = List.generate(widget.labels.length, (i) {
      return InkWell(
          onTap: () => _onChange(i),
          child: Container(
            padding: const EdgeInsets.only(bottom: 6),
            decoration: currentIndex == i ? const CustomTabIndicator() : null,
            child: Text(
              widget.labels[i],
              style:
                  currentIndex == i ? widget.selectedStyle : widget.labelStyle,
            ),
          ));
    });

    int len = children.length;
    for (var i = 1; i < len; i++) {
      children.insert(
          i,
          const SizedBox(
            width: 24,
          ));
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
