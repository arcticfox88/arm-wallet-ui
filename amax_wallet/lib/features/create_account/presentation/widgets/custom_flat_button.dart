import 'package:flutter/material.dart';

import '../../../../theme/color.dart';

class CustomFlatButton extends StatelessWidget {
  final String text;
  final bool enable;
  final GestureTapCallback? onTap;

  const CustomFlatButton(
      {Key? key, required this.text, this.onTap, this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: enable ? onTap : null,
        child: Container(
          width: double.infinity,
          height: 48,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: enable ? primaryBlue : const Color(0xFFA1A5B8),
              borderRadius: BorderRadius.circular(8)),
          child: Text(text,style: const TextStyle(color: Colors.white,fontSize: 17),),
        ));
  }
}
