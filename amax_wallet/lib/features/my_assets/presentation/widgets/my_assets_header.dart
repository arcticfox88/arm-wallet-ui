import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants/assets.dart';
import '../../../../theme/color.dart';
import '../style.dart';

class MyAssetsHeader extends StatelessWidget {
  const MyAssetsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: primaryBlue,
              borderRadius: BorderRadius.circular(16)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          '估值资产',
                          style: assetsTextStyle,
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        SvgPicture.asset(SvgName.assetsEye),
                        const Spacer(flex: 1),
                        SvgPicture.asset(SvgName.assetsLeftArrow),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        Text("2400.00", style: assetsNumStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("ap56li0zoo11", style: assetsTextStyle),
                        const SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(SvgName.assetsCopy)
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(ImgName.assetsCardBg),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 22,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _buildNavigationButtons(),
        ),
        const SizedBox(
          height: 38,
        ),
      ],
    );
  }

  _onNavigateBtnClick(String name) {
    switch (name) {
      case SvgName.assetsScan:
      case SvgName.assetsTransfer:
      case SvgName.assetsCollect:
      case SvgName.assetsResource:
      default:
    }
  }

  _buildNavigationButtons() {
    var iconNames = const [
      SvgName.assetsScan,
      SvgName.assetsTransfer,
      SvgName.assetsCollect,
      SvgName.assetsResource
    ];

    return iconNames
        .map((name) => InkWell(
              onTap: () => _onNavigateBtnClick(name),
              child: Container(
                width: 48,
                height: 48,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xFF2164B6).withOpacity(0.08),
                          offset: const Offset(0.0, 2),
                          blurRadius: 16,
                          spreadRadius: 0.2),
                    ]),
                child: SvgPicture.asset(name),
              ),
            ))
        .toList();
  }
}
