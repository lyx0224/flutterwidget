import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:magpie_fly/magpie_fly.dart' hide BannerState;
import 'package:myflutterwiget/fish_redux/detail/Detail_page/banner_component/Banner_component/state.dart';
import 'package:myflutterwiget/util.dart';

Widget buildView(
    BannerState state, Dispatch dispatch, ViewService viewService) {
  const margin = 15.0;
  //Container的decoraton无法实现圆角，用ClipRRect实现。
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: BannerWidget(
      width: MediaQuery.of(viewService.context).size.width - margin * 2,
      height: 70,
      data: state.dataList,
      buildShowView: (index, data) {
        return Image.network(
          data['image'],
          fit: BoxFit.fitWidth,
        );
      },
      onBannerClickListener: (index, data) {
        showToast(viewService.context, 'you clicked banner $index');
      },
    ),
  );
}
