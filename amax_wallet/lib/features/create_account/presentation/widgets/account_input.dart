import 'package:amax_wallet/common/widgets/input_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/style.dart';
import '../create_account_page_ctrl.dart';

class AccountInput extends ConsumerWidget {
  final FocusNode? focusNode;

  const AccountInput({Key? key, this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var ctrl = ref.watch(createAccountCtrlProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputWidget(
          focusNode: focusNode,
          hint: "由a-z,1-5组成的12位字符",
          onSaved: ctrl.saveAccountName,
          controller: ctrl.accountEditCtrl,
          keyboardType: TextInputType.text,
          onChanged: (val) {

          },
          inputFormatters: [
            LengthLimitingTextInputFormatter(12),
            FilteringTextInputFormatter.allow(RegExp("[a-z]|[1-5]")),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Consumer(builder: (ctx, ref, _) {
          AccountCheck check = ref.watch(stateProvider);
          var tips = '';
          var s = errorTipsStyle;
          if (check == AccountCheck.wrongLength) {
            tips = '名称长度不足(由a-z，1-5组成的12位字符)';
            s = errorTipsStyle;
          } else if (check == AccountCheck.accountExists) {
            tips = '当前账号已存在';
            s = errorTipsStyle;
          } else if (check == AccountCheck.wait) {
            tips = '';
          } else {
            tips = '当前账号可用';
            s = successTipsStyle;
          }
          return Text(
            tips,
            style: s,
          );
        }),
      ],
    );
  }
}
