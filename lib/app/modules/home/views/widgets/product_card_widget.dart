import 'package:bl_task/app/core/utils/common_space.dart';
import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:bl_task/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/values/color_manager.dart';
import '../../../../data/models/product_list_response_models.dart';
import 'image_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({super.key, required this.item});

  final Hit? item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAILS, arguments: {"itemDetails": item});
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
                  ImageWidget(image: item?.recipe?.image ?? ""),
                  Positioned(
                    top: 5.w,
                    left: 5.h,
                    child: Text(
                      item?.recipe?.label ?? "",
                      style: TextStyles.whiteBoldLargeStyle,
                    ),
                  ),
                  Positioned(
                    left: 5.w,
                    bottom: 5.h,
                    child: Text(
                      item?.recipe?.source ?? "",
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
                        item?.recipe?.calories?.toStringAsFixed(0)??"",
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
                        item?.recipe?.ingredients?.length.toString()??"0",
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
