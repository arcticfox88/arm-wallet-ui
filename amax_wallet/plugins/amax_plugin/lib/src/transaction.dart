class Transaction {
  int? expiresSeconds;
  int? blocksBehind;
  bool? useLastIrreversible;
  List<TransAction> actions;

  Transaction(this.actions,
      {this.expiresSeconds, this.blocksBehind, this.useLastIrreversible});
}

class TransAction {
  String account;
  String name;
  List<TransAuth> authorization;
  String data;
  bool? isContextFree;

  TransAction(this.account, this.name, this.authorization, this.data,
      {this.isContextFree});
}

class TransAuth {
  final String actor;
  final String permission;

  TransAuth(this.actor, this.permission);
}
