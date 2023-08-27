import 'package:bl_task/app/core/utils/reponsive_ui_service.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({Key? key,required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      errorBuilder: (context, error, stackTrace) {
        return Image.network(
          "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-1-scaled-1150x647.png",
          fit: BoxFit.fill,
          height: 180.h,
        );
      },
      image ?? "",
      fit: BoxFit.fill,
      height: 180.h,
      color: Colors.grey.withOpacity(1),
      colorBlendMode: BlendMode.modulate,
    );
  }
}
