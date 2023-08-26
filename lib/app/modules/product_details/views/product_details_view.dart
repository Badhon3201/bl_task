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
import '../../home/views/widgets/search_field_widget.dart';
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
      length: 4,
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
                "Wok-Fried Duck & Oyster Sauce",
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
                "BBC Good Food",
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
              "http://t0.gstatic.com/licensed-image?q=tbn:ANd9GcQ4a4S1-1pcCIAYVXBo4RdOcH_quTfYW0shLrqbqv5JCwiQKN8rB8zbQADwDXCc7qmnxpguWhdTsMr8jPLLpDY",
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
                itemCount: 3,
                itemBuilder: (context, index) => const HealthTypeListTile(),
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
                itemCount: 3,
                itemBuilder: (context, index) => const HealthTypeListTile(),
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
              itemCount: 5,
              itemBuilder: (context, index) => const IngredientsListTile(),
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
                Expanded(child: nutritionDetails("CAL / SERV", "7")),
                Container(
                  height: 45,
                  width: 1,
                  decoration: const BoxDecoration(color: Colors.black),
                ),
                Expanded(child: nutritionDetails("CAL / SERV", "8")),
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
          Text(
            "Low-Carb, Dairy-Free, Egg-Free, Peanut-Free, Tree-Nut-Free, Soy-Free, Fish-Free",
            style: GoogleFonts.poppins(
              color: ColorManager.grayColor,
              decoration: TextDecoration.underline,
            ),
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
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(25.0)),
            child: TabBar(
              indicator: BoxDecoration(
                  color: ColorManager.greenColor,
                  borderRadius: BorderRadius.circular(25.0)),
              labelColor: ColorManager.blackColor,
              unselectedLabelColor: ColorManager.grayColor,
              tabs: const [
                Tab(
                  text: 'Fat',
                ),
                Tab(
                  text: 'Carbs',
                ),
                Tab(
                  text: 'Protein',
                ),
                Tab(
                  text: 'Cholesterol',
                )
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
              children: [
                Padding(
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
                                    "Fat",
                                    style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(Icons.keyboard_arrow_down_sharp)
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
                                        "7g",
                                        style: GoogleFonts.poppins(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      CommonSpace.sizedBoxW,
                                      Text(
                                        "11%",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 155.w,
                            child: Padding(
                              padding: EdgeInsets.only(left: 35.0.w),
                              child: Text(
                                "Cholesterol",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 110.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "7g",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                  ),
                                ),
                                CommonSpace.sizedBoxW,
                                Text(
                                  "11%",
                                  style: GoogleFonts.poppins(
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text("Status Pages"),
                ),
                Center(
                  child: Text('Calls Page'),
                ),
                Center(
                  child: Text('Settings Page'),
                )
              ],
            ),
          ),
          CommonSpace.sizedBoxH,
          CommonSpace.sizedBoxH,
        ],
      ),
    );
  }
}
