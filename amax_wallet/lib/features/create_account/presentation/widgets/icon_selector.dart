import 'package:flutter/material.dart';

typedef OnSelected = void Function(bool active);

class IconSelector extends StatefulWidget {
  final Widget defaultIcon;
  final Widget activeIcon;
  final OnSelected? onSelected;
  final bool active;

  const IconSelector(
      {Key? key,
      required this.defaultIcon,
      required this.activeIcon,
      this.onSelected,
      this.active = false})
      : super(key: key);

  @override
  State<IconSelector> createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  bool _active = false;

  @override
  void initState() {
    _active = widget.active;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _active = !_active;
          if(widget.onSelected != null){
            widget.onSelected!(_active);
          }
        });
      },
      child: _active ? widget.activeIcon : widget.defaultIcon,
    );
  }
}
