import 'package:pigeon/pigeon.dart';

@HostApi()
abstract class AmaxPluginAPI {
  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  int createClient(ClientOption option);

  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  void releaseClient(int clientId);

  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  void transfer(
      int clientId, String from, String to, String quantity, String memo);

  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  void buyRam(int clientId, String payer, String receiver, int bytes);

  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  void stakeCpuAndNet(int clientId, String from, String receiver,
      String cpuQuantity, String netQuantity, bool transfer);

  @TaskQueue(type: TaskQueueType.serialBackgroundThread)
  void sendTransaction(Trx trx);
}

class ClientOption {
  String? baseUrl;
  bool? enableDebug;
}

class Trx {
  int? clientId;
  int? expiresSeconds;
  int? blocksBehind;
  bool? useLastIrreversible;
  List<TrxAction?>? actions;
}

class TrxAction {
  String? account;
  String? name;
  List<TrxAuth?>? authorization;
  String? data;
  bool? isContextFree;
}

class TrxAuth {
  String? actor;
  String? permission;
}
