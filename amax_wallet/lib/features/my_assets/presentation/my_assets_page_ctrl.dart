import 'dart:collection';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/asset_item_model.dart';

class AssetsItemCtrl
    extends StateNotifier<AsyncValue<UnmodifiableListView<AssetItemModel>>> {

  List<AssetItemModel> _items = [];

  AssetsItemCtrl()
      : super(AsyncData(UnmodifiableListView<AssetItemModel>(const []))){
    _init();
  }

  Future<void> _init() async {
    state = const AsyncValue.loading();
    // state = await AsyncValue.guard(()=> );

  }

  void removeItem(AssetItemModel model){
    _items.remove(model);
    state = AsyncValue.data(UnmodifiableListView(_items));
  }
}

final assetsCtrl = StateNotifierProvider.autoDispose<AssetsItemCtrl,
    AsyncValue<UnmodifiableListView<AssetItemModel>>>((ref) {
  return AssetsItemCtrl();
});
