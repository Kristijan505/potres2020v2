import 'package:flutter/material.dart';
import 'package:potres2020v2/Views/add_post_age.dart';
import 'package:potres2020v2/Views/home_page.dart';
import 'package:potres2020v2/Views/splash_page.dart';

Route<dynamic> route(StatefulWidget page, {RouteSettings settings}) {
  return PageRouteBuilder(transitionDuration: Duration.zero, pageBuilder: (context, animation, animation2) => page, settings: settings);
}

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return route(SplashPage(), settings: settings);
    case '/home':
      return route(HomePage(), settings: settings);
    case '/input':
      return route(AddPostPage(), settings: settings);
    default:
      return route(SplashPage(), settings: settings);
  }
}
