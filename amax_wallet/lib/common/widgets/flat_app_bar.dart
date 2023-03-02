import 'package:flutter/material.dart';
import '../../theme/style.dart';

/// FlatAppBar
class FlatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? rightText;
  final TextStyle? titleStyle;
  final TextStyle? rightTextStyle;
  final Color? backgroundColor;
  final Widget? rightWidget;

  const FlatAppBar(
      {super.key,
      required this.title,
      this.titleStyle,
      this.rightTextStyle,
      this.backgroundColor,
      this.rightText,
      this.rightWidget});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: backgroundColor ?? Colors.white,
        child: Stack(
          children: [
            const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Icon(Icons.arrow_back),
                )),
            Align(
                alignment: Alignment.center,
                child: Text(title, style: titleStyle ?? appBarTitle)),
            _buildRightWidget()
          ],
        ),
      ),
    );
  }

  _buildRightWidget() {
    Widget child = const SizedBox();
    if (rightWidget != null) {
      child = rightWidget!;
    } else if (rightText != null) {
      child = Padding(
        padding: const EdgeInsets.only(right: 15),
        child: Text(
          rightText!,
          style: rightTextStyle ?? actionTextStyle,
        ),
      );
    } else {
      return child;
    }
    return Align(
      alignment: Alignment.centerRight,
      child: child,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
