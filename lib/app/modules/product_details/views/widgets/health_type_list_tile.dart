import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../../core/values/color_manager.dart';

class HealthTypeListTile extends StatelessWidget {
  const HealthTypeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10.w),
      height: 15.h,
      width: 91.w,
      decoration: BoxDecoration(
          color: ColorManager.grayLightColor,
          borderRadius: BorderRadius.circular(10.r)),
      child: Center(
          child: Text(
            "Mediterranean",
            style: TextStyles.poppinsStyle,
          )),
    );
  }
}
