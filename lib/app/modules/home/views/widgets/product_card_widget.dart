import 'package:bl_task/app/core/utils/common_space.dart';
import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:bl_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/values/color_manager.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: ColorManager.appbarBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: ColorManager.grayColor.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(1, 0),
              )
            ]),
        child: Column(
          children: [
            SizedBox(
              height: 138.h,
              child: Stack(
                children: [
                  Image.network(
                    "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQ4a4S1-1pcCIAYVXBo4RdOcH_quTfYW0shLrqbqv5JCwiQKN8rB8zbQADwDXCc7qmnxpguWhdTsMr8jPLLpDY",
                    fit: BoxFit.fill,
                    height: 180.h,
                    color: Colors.grey.withOpacity(1),
                    colorBlendMode: BlendMode.modulate,
                  ),
                  Positioned(
                    top: 5.w,
                    left: 5.h,
                    child: Text(
                      "Chicken Fried Rice",
                      style: TextStyles.whiteBoldLargeStyle,
                    ),
                  ),
                  Positioned(
                    left: 5.w,
                    bottom: 5.h,
                    child: Text(
                      "BBC Good Food",
                      style: TextStyles.whiteBoldLargeStyle,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 30.h,
              width: Get.width,
              decoration:
                  BoxDecoration(color: ColorManager.appbarBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Text(
                        "610",
                        style: TextStyles.greenBoldStyle,
                      ),
                      CommonSpace.sizedBoxW,
                      Text(
                        "CAL",
                        style: TextStyles.grayBoldStyle,
                      ),
                    ],
                  ),
                  Container(
                    height: 20.h,
                    width: 2.w,
                    decoration: BoxDecoration(
                      color: ColorManager.grayColor.withOpacity(0.5),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "3",
                        style: TextStyles.greenBoldStyle,
                      ),
                      CommonSpace.sizedBoxW,
                      Text(
                        "INGR",
                        style: TextStyles.grayBoldStyle,
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
