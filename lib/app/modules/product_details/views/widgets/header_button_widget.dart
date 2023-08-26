import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/values/color_manager.dart';

class HeaderButtonWidget extends StatelessWidget {
  const HeaderButtonWidget({super.key,required this.images});
  final String images;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22.h,
      width: 22.h,
      decoration: BoxDecoration(
          color: ColorManager.greenColor,
          borderRadius: BorderRadius.circular(10)),
      child: Image.asset(images),
    );
  }
}
