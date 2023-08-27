import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/values/color_manager.dart';
import '../../../../data/models/product_list_response_models.dart';

class IngredientsListTile extends StatelessWidget {
  const IngredientsListTile({super.key,required this.ingredient});
  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      height: 90.h,
      width: 97.w,
      decoration: BoxDecoration(
          color: ColorManager.greenColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 30.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15.r),
                    bottomRight: Radius.circular(15.r),
                  ),
                  color: const Color(0xFFc7f891)),
              child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      ingredient.text??"",overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                  )),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              height: 60.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  topLeft: Radius.circular(20.r),
                ),
                color: ColorManager.greenColor,
              ),
              child: Center(
                  child: Text(
                    "${ingredient.weight?.toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
