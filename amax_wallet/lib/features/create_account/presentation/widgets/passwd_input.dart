import 'package:amax_wallet/theme/color.dart';
import 'package:flutter/material.dart';
import '../../../../common/widgets/input_widget.dart';
import '../create_account_page_ctrl.dart';

class PasswdInput extends StatelessWidget {
  final FocusNode passwordFocus;
  final FocusNode confirmPasswordFocus;
  final CreateAccountPageCtrl ctrl;

  const PasswdInput(
      {Key? key,
      required this.passwordFocus,
      required this.confirmPasswordFocus,
      required this.ctrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InputWidget(
              isPasswd: true,
              focusNode: passwordFocus,
              onChanged: ctrl.onPassword,
              keyboardType: TextInputType.text,
              hint: '至少 8 位字符，包含大小写字母和数字',
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            height: 0.5,
            color: dividerColor,
          ),
          InputWidget(
              isPasswd: true,
              focusNode: confirmPasswordFocus,
              onChanged: ctrl.onPasswordAgain,
              onSaved: ctrl.savePassword,
              keyboardType: TextInputType.text,
              hint: '请再次输入钱包密码',
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  bottomRight: Radius.circular(8))),
        ],
      ),
    );
  }
}
