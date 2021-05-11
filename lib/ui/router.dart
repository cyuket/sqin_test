import 'package:flutter/material.dart';
import 'package:sqin/constant/routes.dart';
import 'package:sqin/ui/views/details_page.dart';
import 'package:sqin/ui/views/homepage.dart';
import 'package:sqin/ui/views/startupView.dart';

import 'shared/style/fonts.dart';

/// Generate routes for navigation
Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.startUpView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SplashView(),
      );
    case Routes.homePageView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomePageView(),
      );
    case Routes.detailsView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DetailPage(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: AgBodyText('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
