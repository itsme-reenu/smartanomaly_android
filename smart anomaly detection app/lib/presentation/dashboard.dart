import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/core/app_export.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/designpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override

  _DashboardState createState() => _DashboardState();
}

class _DashboardState
    extends State<Dashboard>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildDepthFrameZero(context),
              SizedBox(height: 13.v),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: AppDecoration.fillPrimaryContainer,
                    child: Column(
                      children: [
                        _buildTabview(context),
                        SizedBox(
                          height: 1114.v,
                          child: TabBarView(
                            controller: tabviewController,
                            children: [
                              GalileoDesignPage(),
                              GalileoDesignPage(),
                              GalileoDesignPage(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildDepthFrameZero(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.v),
      decoration: AppDecoration.fillPrimaryContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.v),
          CustomAppBar(
            actions: [
              AppbarTrailingImage(
                imagePath: ImageConstant.imgDepth6Frame0,
                margin: EdgeInsets.symmetric(horizontal: 16.h),
              ),
            ],
          ),
          SizedBox(height: 10.v),
          Padding(
            padding: EdgeInsets.only(left: 16.h),
            child: Text(
              "Live View",
              style: theme.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 54.v,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.secondaryContainer,
            width: 1.h,
          ),
        ),
      ),
      child: TabBar(
        controller: tabviewController,
        isScrollable: true,
        labelColor: theme.colorScheme.onPrimary,
        unselectedLabelColor: theme.colorScheme.onPrimaryContainer,
        tabs: [
          Tab(
            child: Text(
              "All Feeds",
            ),
          ),
          Tab(
            child: Text(
              "Favorites",
            ),
          ),
          Tab(
            child: Text(
              "History",
            ),
          ),
        ],
      ),
    );
  }
}

class AppbarTrailingImage extends StatelessWidget {
  final String imagePath;
  final EdgeInsetsGeometry margin;

  AppbarTrailingImage({required this.imagePath, required this.margin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Image.asset(imagePath),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  final List<Widget> actions;

  CustomAppBar({required this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
    );
  }
}