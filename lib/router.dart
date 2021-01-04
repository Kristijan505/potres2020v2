import 'package:flutter/material.dart';
import 'package:potres2020v2/Views/add_post_page.dart';
import 'package:potres2020v2/Views/home_page.dart';
import 'package:potres2020v2/Views/splash_page.dart';

import 'Views/login_page.dart';

Route<dynamic> route(Widget page, {RouteSettings settings}) {
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
    case '/login':
      return route(LoginPage(), settings: settings);
    default:
      return route(SplashPage(), settings: settings);
  }
}
