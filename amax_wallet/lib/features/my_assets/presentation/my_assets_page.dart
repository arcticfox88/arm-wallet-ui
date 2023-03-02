import 'package:amax_wallet/common/widgets/rx_value.dart';
import 'package:amax_wallet/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../common/widgets/flat_app_bar.dart';
import '../../../common/widgets/rb.dart';
import '../../../theme/color.dart';
import 'widgets/assets_view.dart';
import 'widgets/custom_tab.dart';
import 'widgets/dapp_view.dart';
import 'widgets/my_assets_header.dart';

class MyAssetsPage extends ConsumerWidget {
  MyAssetsPage({Key? key}) : super(key: key);

  final RxInt tabIndex = 0.rx;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: FlatAppBar(
        title: "我的资产",
        backgroundColor: mainBgColor,
      ),
      body: Container(
        color: mainBgColor,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: NestedScrollView(
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  const SliverToBoxAdapter(
                    child: MyAssetsHeader(),
                  ),
                  SliverPersistentHeader(
                    floating: true,
                    pinned: true,
                    delegate: StickyTabBarDelegate(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTabBar(
                            onChanged: (i) => tabIndex.value = i,
                            labels: const ['资产', 'Dapp'],
                          ),
                          SvgPicture.asset(SvgName.assetsAdd)
                        ],
                      ),
                    ),
                  )
                ],
            body: Rb<int>(
              bind: tabIndex,
              builder: (_, val) => IndexedStack(
                index: val,
                children:  [AssetsView(), DAppView()],
              ),
            )),
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      child;

  @override
  double get maxExtent => 37;

  @override
  double get minExtent => 37;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
