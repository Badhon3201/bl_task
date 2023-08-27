import 'package:bl_task/app/core/utils/common_space.dart';
import 'package:bl_task/app/core/utils/styles.dart';
import 'package:bl_task/app/core/values/assets_image_manager.dart';
import 'package:bl_task/app/core/values/color_manager.dart';
import 'package:bl_task/app/core/values/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/reponsive_ui_service.dart';
import 'widgets/search_field_widget.dart';
import '../controllers/product_details_controller.dart';
import 'widgets/header_button_widget.dart';
import 'widgets/health_type_list_tile.dart';
import 'widgets/ingredients_list_tile.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveUIService().init(const Size(375, 812), context);
    return DefaultTabController(
      length: controller.productDetails.value!.recipe!.digest!.length,
      initialIndex: controller.initialTabIndex.value,
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Positioned(
                right: -60.w,
                top: 0,
                child: Image.asset(
                  AssetsImageManager.productDetailsCurve,
                  height: 202.h,
                  width: 227.w,
                ),
              ),
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    appBarSection(),
                    bodySection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget appBarSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // IconButton(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AssetsImageManager.imageDrawer,
            height: 40.h,
            width: 40.h,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(1, 1)),
                    ]),
                child: const SearchFieldWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "REFINE SEARCH BY",
                    style: TextStyles.grayStyle,
                  ),
                  CommonSpace.sizedBoxW5,
                  Text(
                    "Calories, Diet, Ingredients",
                    style: TextStyles.blackBoldStyle,
                  ),
                  const Icon(Icons.keyboard_arrow_down_sharp)
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10.0.r),
          child: Image.asset(
            AssetsImageManager.actionIcon,
            height: 35.h,
            width: 35.h,
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }

  Widget bodySection() {
    return Expanded(
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            headersSection(),
            healthLabelSection(),
            CommonSpace.sizedBoxH,
            CommonSpace.sizedBoxH,
            cuisineTypeSection(),
            CommonSpace.sizedBoxH,
            ingredientsSection(),
            CommonSpace.sizedBoxH,
            preparationSection(),
            CommonSpace.sizedBoxH,
            nutritionSection(),
            CommonSpace.sizedBoxH,
            tagsSection(),
            CommonSpace.sizedBoxH,
            CommonSpace.sizedBoxH,
            nutritionSectionTwo()
          ],
        ),
      ),
    );
  }

  Widget headersSection() {
    return Container(
      alignment: Alignment.center,
      height: 164.h,
      width: 325.w,
      child: Row(children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${controller.productDetails.value?.recipe?.label}",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CommonSpace.sizedBoxH,
              Text(
                "See full recipe on: ",
                style: GoogleFonts.poppins(
                  fontSize: 10,
                ),
              ),
              Text(
                controller.productDetails.value?.recipe?.source ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 10, decoration: TextDecoration.underline),
              ),
              CommonSpace.sizedBoxH,
              CommonSpace.sizedBoxH,
              Row(
                children: [
                  const HeaderButtonWidget(images: AssetsImageManager.plusIcon),
                  CommonSpace.sizedBoxW,
                  const HeaderButtonWidget(
                      images: AssetsImageManager.shareImage),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.network(
              controller.productDetails.value?.recipe?.image ?? "",
              height: 168,
              width: 168,
              fit: BoxFit.cover,
            ),
          ),
        )
      ]),
    );
  }

  Widget healthLabelSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${StringResources.healthLabels}:",
            style: TextStyles.samiBoldGrayStyle,
          ),
          CommonSpace.sizedBoxH,
          SizedBox(
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller
                    .productDetails.value?.recipe?.healthLabels?.length,
                itemBuilder: (context, index) => HealthTypeListTile(
                    healthLabel: controller.productDetails.value?.recipe
                            ?.healthLabels?[index] ??
                        ""),
              )),
        ],
      ),
    );
  }

  Widget cuisineTypeSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${StringResources.cuisineType}:",
            style: TextStyles.samiBoldGrayStyle,
          ),
          CommonSpace.sizedBoxH,
          SizedBox(
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: controller
                    .productDetails.value?.recipe?.cuisineType?.length,
                itemBuilder: (context, index) => HealthTypeListTile(
                    healthLabel: controller.productDetails.value?.recipe
                            ?.cuisineType?[index] ??
                        ""),
              )),
        ],
      ),
    );
  }

  Widget ingredientsSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.ingredients,
            style: TextStyles.titleStyle,
          ),
          CommonSpace.sizedBoxH,
          SizedBox(
            height: 92.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.productDetails.value?.recipe?.ingredients?.length,
              itemBuilder: (context, index) => IngredientsListTile(
                  ingredient: controller
                      .productDetails.value!.recipe!.ingredients![index]),
            ),
          )
        ],
      ),
    );
  }

  Widget preparationSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.preparation,
            style: TextStyles.titleStyle,
          ),
          CommonSpace.sizedBoxH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Instructions on",
                style: TextStyles.grayStyle,
              ),
              CommonSpace.sizedBoxW5,
              Text(
                "BBC Food",
                style: TextStyles.blackBoldStyle,
              ),
              const Icon(Icons.keyboard_arrow_down_sharp)
            ],
          ),
        ],
      ),
    );
  }

  Widget nutritionSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.nutrition,
            style: TextStyles.titleStyle,
          ),
          Container(
            height: 75.h,
            width: Get.width,
            decoration: BoxDecoration(
              color: ColorManager.greenColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: Row(
              children: [
                Expanded(child: nutritionDetails("CAL / SERV", "146")),
                Container(
                  height: 45,
                  width: 1,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                Expanded(child: nutritionDetails("Daily Value", "7%")),
                Container(
                  height: 45,
                  width: 1,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                Expanded(child: nutritionDetails("SERVINGS", "8")),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget nutritionDetails(String title, String value) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 10.w),
          height: 23.h,
          width: 38.w,
          decoration: BoxDecoration(
              color: ColorManager.grayLightColor,
              borderRadius: BorderRadius.circular(10.r)),
          child: Center(
              child: Text(
            value,
            style: GoogleFonts.poppins(),
          )),
        ),
        CommonSpace.sizedBoxH,
        CommonSpace.sizedBoxH,
        Text(
          title,
          style: GoogleFonts.poppins(),
        ),
      ],
    );
  }

  Widget tagsSection() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringResources.tags,
            style: TextStyles.titleStyle,
          ),
          Wrap(
            children: [
              for (var item in controller.tagsList)
                Text(
                  "$item , ",
                  style: GoogleFonts.poppins(
                    color: ColorManager.grayColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }

  Widget nutritionSectionTwo() {
    return SizedBox(
      width: 325.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonSpace.sizedBoxH,
          Text(
            StringResources.nutrition,
            style: TextStyles.titleStyle,
          ),
          CommonSpace.sizedBoxH,
          Container(
            height: 45.h,
            width: Get.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: ColorManager.greenColor,
                //color: Colors.red,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 3,
                      color: ColorManager.grayColor.withOpacity(0.2),
                      spreadRadius: 0,
                      offset: const Offset(0, 1))
                ]),
            child: Row(
              children: [
                Obx(() => controller.initialTabIndex.value == 0
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          controller.tabController.previousIndex;
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      )),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: ColorManager.whiteColor,
                      //color: Colors.red,
                    ),
                    child: TabBar(
                        controller: controller.tabController,
                        isScrollable: true,
                        padding: EdgeInsets.all(8.r),
                        onTap: (v) {
                          controller.initialTabIndex.value = v;
                        },
                        indicator: BoxDecoration(
                            color: ColorManager.greenColor,
                            borderRadius: BorderRadius.circular(25.0)),
                        labelColor: ColorManager.blackColor,
                        unselectedLabelColor: ColorManager.grayColor,
                        tabs: controller.productDetails.value!.recipe!.digest!
                            .map(
                              (e) => Tab(
                                text: e.label,
                              ),
                            )
                            .toList()),
                  ),
                ),
                Obx(() => controller.initialTabIndex.value ==
                        controller
                                .productDetails.value!.recipe!.digest!.length -
                            1
                    ? const SizedBox()
                    : InkWell(
                        onTap: () {
                          controller.initialTabIndex.value =
                              controller.tabController.length + 1;
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      ))
              ],
            ),
          ),
          CommonSpace.sizedBoxH,
          CommonSpace.sizedBoxH,
          Container(
            height: 121.h,
            width: 325.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ColorManager.greenColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25.r),
                bottomLeft: Radius.circular(25.r),
                topRight: Radius.circular(25.r),
              ),
            ),
            child: TabBarView(
              controller: controller.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: controller.productDetails.value!.recipe!.digest!
                  .map(
                    (e) => Padding(
                      padding:
                          EdgeInsets.only(left: 20.0.w, top: 10.h, right: 20.w),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width: 155.w,
                                  child: Row(
                                    children: [
                                      Text(
                                        e.tag ?? "",
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const Icon(
                                          Icons.keyboard_arrow_down_sharp)
                                    ],
                                  )),
                              SizedBox(
                                  width: 110.w,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            "${e.daily?.toStringAsFixed(0)}${e.unit}",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          CommonSpace.sizedBoxW,
                                          Text(
                                            "${e.total?.toStringAsFixed(0)}%",
                                            style: GoogleFonts.poppins(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                        color: ColorManager.blackColor,
                                      )
                                    ],
                                  )),
                            ],
                          ),
                          ListView.builder(
                            itemCount: e.sub!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              var item = e.sub![index];
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 155.w,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 35.0.w),
                                      child: Text(
                                        item.label ?? "",
                                        style: GoogleFonts.poppins(
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 110.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          "${item.daily?.toStringAsFixed(0)}${e.unit}",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          ),
                                        ),
                                        CommonSpace.sizedBoxW,
                                        Text(
                                          "${item.total?.toStringAsFixed(0)}%%",
                                          style: GoogleFonts.poppins(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          CommonSpace.sizedBoxH,
          CommonSpace.sizedBoxH,
        ],
      ),
    );
  }
}
