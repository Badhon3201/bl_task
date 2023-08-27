import 'package:bl_task/app/core/utils/common_space.dart';
import 'package:bl_task/app/core/values/assets_image_manager.dart';
import 'package:bl_task/app/core/values/color_manager.dart';
import 'package:bl_task/app/modules/home/views/widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/utils/reponsive_ui_service.dart';
import '../../../core/utils/styles.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveUIService().init(const Size(375, 812), context);
    return Scaffold(
      appBar: appBar(),
      body: Obx(() {
        return controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : bodySection();
      }),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: ColorManager.appbarBackgroundColor,
      leading: Padding(
        padding: EdgeInsets.all(4.0.r),
        child: Image.asset(AssetsImageManager.imageDrawer),
      ),
      title: Container(
          padding: const EdgeInsets.only(bottom: 5),
          height: 45.h,
          child: SearchBar(
            controller: controller.searchController,
            hintText: 'Search',
            hintStyle: TextStyles.mHintStyle,
            onChanged: (v){
              controller.getProduct();
            },
            trailing: [
              InkWell(
                onTap: (){
                  controller.searchController.clear();
                  controller.getProduct();
                },
                child: Container(
                  height: 20.r,
                  width: 20.r,
                  decoration: BoxDecoration(
                    color: ColorManager.grayColor,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  child: Icon(
                    Icons.clear,
                    size: 18.r,
                    color: ColorManager.whiteColor,
                  ),
                ),
              )
            ],
          )),
      centerTitle: true,
      actions: [
        IconButton(
          color: ColorManager.grayColor,
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 25.r,
            color: ColorManager.grayColor,
          ),
        )
      ],
    );
  }

  Widget bodySection() {
    return Column(
      children: [
        CommonSpace.sizedBoxH,
        Container(
          height: 35.h,
          width: Get.width,
          decoration: BoxDecoration(
              color: ColorManager.appbarBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.grayColor.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: const Offset(1, 0),
                )
              ]),
        ),
        Expanded(
          child: GridView.builder(
              primary: false,
              shrinkWrap: true,
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                mainAxisExtent: 180.h,
              ),
              itemCount: controller.productListResponse.value?.hits?.length,
              itemBuilder: (BuildContext context, int index) {
                var item = controller.productListResponse.value?.hits?[index];
                return ProductCardWidget(item: item);
              }),
        ),
      ],
    );
  }
}
