import 'package:amax_wallet/api/api.dart';
import 'package:amax_wallet/api/models/token_list_model.dart';
import 'package:gio/gio.dart';

Future<List<TokenModel>?> getTokenList() async {
  Response resp = await API.get('api/pptoken/v1/tokens/list', params: {
    'is_main': '1', // 1 正式网 0 测试网
    'token_type': '4', // 1 erc721 2 erc20
    'token_name': '',
    'token_id': '',
    'chain_address': '',
    'chain_name': 'amax',
    'chain_id': '0',
    'page': '1',
    'size': '5',
    'is_hot': '0',
    'is_auth': '0',
    'is_recommend': '1',
    'input_search': '',
  });
  var tokenList = TokenListModel.fromJson(await resp.toJson());
  return tokenList.data?.list;
}
