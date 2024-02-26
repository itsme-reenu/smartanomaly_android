import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/core/app_export.dart';

// ignore_for_file: must_be_immutable
class GalileoDesignPage extends StatefulWidget {
  const GalileoDesignPage({Key? key})
      : super(
          key: key,
        );

  @override
  GalileoDesignPageState createState() => GalileoDesignPageState();
}

class GalileoDesignPageState extends State<GalileoDesignPage>
    with AutomaticKeepAliveClientMixin<GalileoDesignPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: SizeUtils.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 25.v),
                Column(
                  children: [
                    _buildLivingRoom(
                      context,
                      image: ImageConstant.imgDepth5Frame0,
                      livingRoomText: "Front Door",
                      homeText: "Home",
                      liveText: "Live",
                    ),
                    SizedBox(height: 13.v),
                    _buildLivingRoom(
                      context,
                      image: ImageConstant.imgDepth5Frame0201x358,
                      livingRoomText: "Living Room",
                      homeText: "Home",
                      liveText: "Live",
                    ),
                    SizedBox(height: 16.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "People",
                          style: CustomTextStyles.titleMediumMedium,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Text(
                          "32",
                          style: theme.textTheme.headlineLarge,
                        ),
                      ),
                    ),
                    SizedBox(height: 8.v),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.h),
                        child: Row(
                          children: [
                            Text(
                              "Now",
                              style: theme.textTheme.bodyLarge,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.h),
                              child: Text(
                                "+12%",
                                style: CustomTextStyles.titleMediumGreenA400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 23.v),
                    _buildTimeSlots(context),
                    SizedBox(height: 11.v),
                    Container(
                      height: 20.v,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildTimeSlots(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 145.v,
                    width: 68.h,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.onError,
                      border: Border(
                        top: BorderSide(
                          color: theme.colorScheme.onPrimaryContainer,
                          width: 2.h,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.v),
                Text(
                  "10AM",
                  style: theme.textTheme.labelLarge,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18.v),
            child: Column(
              children: [
                Container(
                  height: 145.v,
                  width: 90.h,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onError,
                    border: Border(
                      top: BorderSide(
                        color: theme.colorScheme.onPrimaryContainer,
                        width: 2.h,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25.v),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "11AM",
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 164.v,
                width: 126.h,
                decoration: BoxDecoration(
                  color: theme.colorScheme.onError,
                  border: Border(
                    top: BorderSide(
                      color: theme.colorScheme.onPrimaryContainer,
                      width: 2.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 24.v),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "12PM",
                  style: theme.textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Common widget
  Widget _buildLivingRoom(
    BuildContext context, {
    required String image,
    required String livingRoomText,
    required String homeText,
    required String liveText,
  }) {
    return Container(
      padding: EdgeInsets.all(16.h),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: image,
            height: 201.v,
            width: 358.h,
            radius: BorderRadius.circular(
              12.h,
            ),
          ),
          SizedBox(height: 19.v),
          Text(
            livingRoomText,
            style: CustomTextStyles.titleMedium18.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          SizedBox(height: 1.v),
          Text(
            homeText,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 4.v),
          Text(
            liveText,
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
          SizedBox(height: 14.v),
        ],
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


