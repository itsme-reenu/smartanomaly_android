import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/core/app_export.dart';
import 'package:reenu_susan_kurian_112033_s_application1/widgets/custom_elevated_button.dart';


class DesignPage extends StatelessWidget {
  const DesignPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgImage4,
                height: 217.v,
                width: 390.h,
              ),
              SizedBox(height: 50.v),
              Container(
                height: 72.v,
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: appTheme.gray900,
                ),
              ),
              SizedBox(height: 48.v),
              Container(
                width: 369.h,
                margin: EdgeInsets.only(
                  left: 10.h,
                  right: 9.h,
                ),
                child: Text(
                  "USE A MODEL TO CHECK IMAGE \nmodel will detect anomalies in the image ",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleLarge!.copyWith(
                    height: 1.75,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height:35.v),
              CustomElevatedButton(
                text: "Open Camera",
              ),
            SizedBox(height:50.v),
              CustomElevatedButton(
                height: 60.v,
                width: 179.h,
                text: "Pick from device",
                margin: EdgeInsets.only(left: 16.h),
                alignment: Alignment.centerLeft,
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}


class CustomTextStyles {

  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18.fSize,
      );
  static get titleMediumGreenA400 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.greenA400,
        fontWeight: FontWeight.w500,
      );
  static get titleMediumMedium => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w500,
      );
  static get titleSmallOnPrimary => theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}

extension on TextStyle {
  TextStyle get spaceGrotesk {
    return copyWith(
      fontFamily: 'Space Grotesk',
    );
  }
}



class ImageConstant {
  
  // Image folder path
  static String imagePath = 'assets/images';

  // Galileo design images
  static String imgDepth5Frame0 = '$imagePath/img_depth_5_frame_0.png';

  static String imgDepth5Frame0201x358 =
      '$imagePath/img_depth_5_frame_0_201x358.png';

  // Galileo design - Tab Container images
  static String imgDepth6Frame0 = '$imagePath/img_depth_6_frame_0.svg';

  static String imageNotFound = 'assets/images/image_not_found.png';

   // Replace 'default_image.png' with the actual default image path
  static String imgImage1011 = '$imagePath/img_image1_0_1_1.png';
  static String imgImage1012 = '$imagePath/img_image0_0_1.png';
  static String imgImage1013 = '$imagePath/img_image_2.png';
}


