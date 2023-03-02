import 'dart:async';

import 'package:amax_wallet/features/create_account/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../../app/application.dart';


final regExp = RegExp(r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9 _]{8,15}$");
enum AccountCheck { wrongLength, accountExists, success, wait }

final stateProvider =
    StateProvider<AccountCheck>((_) => AccountCheck.wrongLength);

class CreateAccountPageCtrl {
  final TextEditingController accountEditCtrl = TextEditingController();

  CreateAccountPageCtrl(this.ref) {
    accountEditCtrl.addListener(onAccountChange);
  }

  static const _optionalCharacters = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
    '1',
    '2',
    '3',
    '4',
    '5',
  ];
  final Ref ref;

  String _passwd = '';
  String _secondPasswd = '';
  bool _first = true;
  Completer _accountExists = Completer();
  UserModel user = UserModel.empty();

  void onAccountChange() async {
    var content = accountEditCtrl.text;
    var check = ref.read(stateProvider.notifier);
    if (content.length < 12) {
      check.state = AccountCheck.wrongLength;
    } else if (content.length == 12) {
      check.state = AccountCheck.wait;
      _accountExists = Completer();
      var result = await _checkAccountExist(content);
      _accountExists.complete(result);
      if (result) {
        check.state = AccountCheck.accountExists;
      } else {
        check.state = AccountCheck.success;
      }
    }
  }

  void onPassword(String val) {
    _passwd = val;
  }

  void onPasswordAgain(String val) {
    _secondPasswd = val;
  }

  void saveAccountName(String? val) {
    user.account = val ?? '';
  }

  void savePassword(String? val) {
    user.passwd = val ?? '';
  }

  Future<bool> validator() async {
    bool r = false;
    if (accountEditCtrl.text.isEmpty ||
        _passwd.isEmpty ||
        _secondPasswd.isEmpty) {
      _showTips('账号或密码不能为空');
      return r;
    }
    if (_secondPasswd != _passwd) {
      _showTips('您两次输入的密码不相同');
      return r;
    }
    if(!regExp.hasMatch(_passwd)){
      _showTips('密码应为8 ~ 15位字符，包含大小写字母和数字');
      return r;
    }

    var check = ref.read(stateProvider.notifier);
    if (check.state == AccountCheck.wrongLength) {
      _showTips('账号长度不足(由a-z，1-5组成的12位字符)');
      return r;
    } else if (check.state == AccountCheck.accountExists) {
      _showTips('当前账号已存在');
      return r;
    } else if (check.state == AccountCheck.wait) {
      if (await _accountExists.future) {
        _showTips('当前账号已存在');
        return r;
      } else {
        r = true;
      }
    } else if (check.state == AccountCheck.success) {
      r = true;
    }
    return r;
  }

  void _showTips(String tips) {
    Fluttertoast.showToast(
        msg: tips,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 14.0);
  }

  void onHandleNext() {
    if (_first) {
      _first = false;
      var context = ref.read(navigatorProvider).currentContext;
      if(context!=null){
        context.go("/assets");
      }
    }
  }

  void generateRandomAccount() {
    accountEditCtrl.text = _genRandomStr();
  }

  String _genRandomStr() {
    var chs = List.of(_optionalCharacters);
    chs.shuffle();
    var account = ['a', 'p', 'l'];
    account.addAll(chs.getRange(0, 9));
    return account.join();
  }

  Future<bool> _checkAccountExist(String account) {
    return Future.value(false);
  }

  void dispose() {
    accountEditCtrl.dispose();
  }
}

final createAccountCtrlProvider =
    StateProvider.autoDispose<CreateAccountPageCtrl>((ref) {
  var ctrl = CreateAccountPageCtrl(ref);
  ref.onDispose(() {
    ctrl.dispose();
  });
  return ctrl;
});
