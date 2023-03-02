import 'package:amax_wallet/common/widgets/rb.dart';
import 'package:amax_wallet/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../common/widgets/flat_app_bar.dart';
import '../../../common/widgets/rx_value.dart';
import '../../../theme/color.dart';
import '../../../theme/style.dart';
import 'create_account_page_ctrl.dart';
import 'widgets/account_input.dart';
import 'widgets/custom_flat_button.dart';
import 'widgets/icon_selector.dart';
import 'widgets/passwd_input.dart';

class CreateAccountPage extends ConsumerWidget {
  final GlobalKey<FormState> _gk = GlobalKey<FormState>();
  final FocusNode _accountFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  final RxBool _agree = false.rx;

  CreateAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var accountCtrl = ref.watch(createAccountCtrlProvider);
    return Scaffold(
      appBar: const FlatAppBar(
        title: "创建账号",
        rightText: "恢复账号",
        backgroundColor: mainBgColor,
      ),
      body: KeyboardActions(
        config: _getKeyboardConfig(context),
        child: Container(
          color: mainBgColor,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                      key: _gk,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("账号名称", style: labelTextStyle),
                              InkWell(
                                  onTap: () =>
                                      accountCtrl.generateRandomAccount(),
                                  child: const Text("随机生成",
                                      style: labelTextStyle2)),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AccountInput(
                            focusNode: _accountFocus,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text("钱包密码", style: labelTextStyle),
                          const SizedBox(
                            height: 10,
                          ),
                          PasswdInput(
                            passwordFocus: _passwordFocus,
                            confirmPasswordFocus: _confirmPasswordFocus,
                            ctrl: accountCtrl,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Row(
                            children: [
                              IconSelector(
                                  defaultIcon:
                                      SvgPicture.asset(SvgName.notSelectedIcon),
                                  activeIcon:
                                      SvgPicture.asset(SvgName.selectedIcon),
                                  onSelected: (active)=> _agree.value = active),
                              const SizedBox(
                                width: 8,
                              ),
                              const Flexible(
                                child: Text.rich(TextSpan(
                                    text: "我已仔细阅读并同意",
                                    style: hintTextStyle,
                                    children: [
                                      TextSpan(
                                        text: "《隐私服务协议》",
                                        style: actionTextStyle,
                                      )
                                    ])),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 69,
                          ),
                          Rb<bool>(
                              bind: _agree,
                              builder: (_, val) {
                                return CustomFlatButton(
                                  enable: val,
                                  text: "下一步",
                                  onTap: () async{
                                    if (await accountCtrl.validator()) {
                                      _gk.currentState?.save();
                                      accountCtrl.onHandleNext();
                                    }
                                  },
                                );
                              })
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  KeyboardActionsConfig _getKeyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: [
        KeyboardActionsItem(focusNode: _accountFocus, toolbarButtons: [
          (node) {
            return _keyBoardFinish(node);
          }
        ]),
        KeyboardActionsItem(focusNode: _passwordFocus, toolbarButtons: [
          (node) {
            return _keyBoardFinish(node);
          }
        ]),
        KeyboardActionsItem(focusNode: _confirmPasswordFocus, toolbarButtons: [
          (node) {
            return _keyBoardFinish(node);
          }
        ]),
      ],
    );
  }

  GestureDetector _keyBoardFinish(FocusNode node) {
    return GestureDetector(
      onTap: () => node.unfocus(),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Done',
          style: TextStyle(color: Color(0xFF0F152F)),
        ),
      ),
    );
  }
}
