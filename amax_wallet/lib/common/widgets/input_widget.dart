import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputWidget extends StatelessWidget {
  final List<TextInputFormatter>? inputFormatters;
  final BorderRadiusGeometry? borderRadius;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldSetter<String>? onSaved;
  final EdgeInsetsGeometry? padding;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final String? hint;
  final bool isPasswd;

  InputWidget(
      {Key? key,
      this.inputFormatters,
      this.controller,
      this.onChanged,
      this.onSaved,
      EdgeInsetsGeometry? padding,
      BorderRadiusGeometry? borderRadius,
      this.focusNode,
      this.keyboardType,
      this.isPasswd = false,
      this.hint})
      : padding = padding ?? const EdgeInsets.all(15),
        borderRadius = borderRadius ?? BorderRadius.circular(8),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration:
          BoxDecoration(color: Colors.white, borderRadius: borderRadius),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onSaved: onSaved,
        focusNode: focusNode,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        obscureText: isPasswd,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFA1A5B8), fontSize: 15),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            isDense: true,
            contentPadding: padding),
      ),
    );
  }
}
