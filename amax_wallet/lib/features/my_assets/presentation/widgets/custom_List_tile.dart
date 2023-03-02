import 'package:flutter/material.dart';

const avatarID = "avatar";
const titleID = "title";
const valueID = "value";
const hintID = "hint";
const dividerID = "divider";

class CustomListTile extends StatelessWidget {
  final Widget avatar;
  final Widget title;
  final Widget value;
  final Widget hint;
  final bool showDivider;
  final Color? dividerColor;
  final double? dividerHeight;

  const CustomListTile(
      {Key? key,
      required this.title,
      required this.value,
      required this.avatar,
      required this.hint,
      this.dividerColor,
      this.dividerHeight,
      this.showDivider = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      LayoutId(id: avatarID, child: avatar),
      LayoutId(id: titleID, child: title),
      LayoutId(id: valueID, child: value),
      LayoutId(id: hintID, child: hint),
    ];

    if (showDivider) {
      children.add(LayoutId(
          id: dividerID,
          child: Container(
            height: dividerHeight ?? 1,
            color: dividerColor ?? Colors.grey,
          )));
    }
    return CustomMultiChildLayout(
        delegate: _ListTileDelegate(), children: children);
  }
}

class _ListTileDelegate extends MultiChildLayoutDelegate {
  @override
  void performLayout(Size size) {
    Size? avatar;
    Size? title;
    Size? value;
    Size? hint;
    Size? divider;

    if (hasChild(avatarID)) {
      avatar = layoutChild(avatarID, BoxConstraints.loose(size));
    }
    if (hasChild(titleID)) {
      title = layoutChild(titleID, BoxConstraints.loose(size));
    }
    if (hasChild(valueID)) {
      value = layoutChild(valueID, BoxConstraints.loose(size));
    }
    if (hasChild(hintID)) {
      hint = layoutChild(hintID, BoxConstraints.loose(size));
    }
    if (hasChild(dividerID)) {
      divider = layoutChild(dividerID, BoxConstraints.loose(size));
    }

    if (avatar != null && title != null && value != null && hint != null) {
      positionChild(avatarID, Offset(0, (size.height - avatar.height) / 2));
      positionChild(
          titleID, Offset(avatar.width + 12, (size.height - title.height) / 2));

      const spacing = 2;
      var vH = (size.height - value.height - hint.height - spacing) / 2;

      positionChild(valueID, Offset(size.width - value.width, vH));
      positionChild(
          hintID, Offset(size.width - hint.width, vH + value.height + spacing));

      if (divider != null) {
        positionChild(dividerID, Offset(0, size.height - divider.height));
      }
    }
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate old) => old != this;
}
