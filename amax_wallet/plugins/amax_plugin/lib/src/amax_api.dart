import 'dart:async';
import 'package:amax_plugin/amax_plugin.dart';

import 'amax_plugin_api.dart';

class AmaxAPI {
  final AmaxPluginAPI api;

  final Completer<int> _clientInit = Completer();

  AmaxAPI() : api = AmaxPluginAPI();

  ///
  /// Call this method to create an AMAX client.
  ///
  /// Special attention needs to be paid,
  /// this method must be used in pairs with the [dispose] method,
  /// that is, after it is no longer used,
  /// [dispose] must be called to release the memory, otherwise memory leaks will occur.
  ///
  Future<void> newClient(String baseUrl, {bool enableDebug = false}) async {
    var id = await api
        .createClient(ClientOption(baseUrl: baseUrl, enableDebug: enableDebug));
    _clientInit.complete(id);
  }

  Future<void> dispose() async {
    var id = await _clientInit.future;
    api.releaseClient(id);
  }

  Future<void> transfer(
      String from, String to, String quantity, String memo) async {
    var id = await _clientInit.future;
    api.transfer(id, from, to, quantity, memo);
  }

  Future<void> buyRam(String payer, String receiver, int bytes) async {
    var id = await _clientInit.future;
    api.buyRam(id, payer, receiver, bytes);
  }

  Future<void> stakeCpuAndNet(String from, String receiver, String cpuQuantity,
      String netQuantity, bool transfer) async {
    var id = await _clientInit.future;
    api.stakeCpuAndNet(id, from, receiver, cpuQuantity, netQuantity, transfer);
  }

  Future<void> sendTransaction(Transaction transaction) async {
    var id = await _clientInit.future;
    // api.sendTransaction(Trx.from(id, transaction));
  }
}
