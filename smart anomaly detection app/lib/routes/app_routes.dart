import 'package:flutter/material.dart';
import 'package:reenu_susan_kurian_112033_s_application1/presentation/carousel_design.dart';
//import 'package:reenu_susan_kurian_112033_s_application1/presentation/galileo_design_screen/galileo_design_screen.dart';

class AppRoutes {
  //static const String galileoDesignScreen = '/galileo_design_screen';
 static const String carouselScreenRoute = '/carouselScreen';
  static Map<String, WidgetBuilder> routes = {
    carouselScreenRoute: (context) => CarouselScreen()
  };
}
