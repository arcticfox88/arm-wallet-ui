import 'dart:collection';

import 'package:amax_wallet/features/my_assets/presentation/my_assets_page_ctrl.dart';
import 'package:amax_wallet/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../models/asset_item_model.dart';
import 'custom_List_tile.dart';
import 'refresher_header_widget.dart';

class AssetsView extends ConsumerWidget {
  AssetsView({super.key});

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state =
        ref.watch<AsyncValue<UnmodifiableListView<AssetItemModel>>>(assetsCtrl);
    return SmartRefresher(
        controller: _refreshController,
        header: const RefresherHeaderWidget(),
        child: state.maybeWhen(data: (val) {
          _refreshController.refreshCompleted();
          return ListView.builder(
              itemCount: val.length,
              itemBuilder: (ctx, i) {
                return AssetsListItem(model: val[i]);
              });
        }, orElse: () {
          _refreshController.refreshCompleted();
          return const Center(
            child: Text("没有数据"),
          );
        }));
  }
}

class AssetsListItem extends StatelessWidget {
  final AssetItemModel model;

  const AssetsListItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      child: GestureDetector(
        child: SizedBox(
          height: 66,
          child: CustomListTile(
            dividerColor: dividerColor,
            dividerHeight: 0.5,
            title: Text(model.name),
            value: Text(model.amount),
            avatar: Image.asset(model.logoUri),
            hint: Text(model.balance),
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
