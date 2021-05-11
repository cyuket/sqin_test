import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqin/constant/routes.dart';
import 'package:sqin/ui/router.dart';
import 'package:sqin/ui/shared/style/colors.dart';

import 'locator.dart';
import 'services/navigation_service.dart';
import 'ui/shared/logger.dart';

void main() async {
  /// Only in debug mode
  Log.init(kReleaseMode);

  WidgetsFlutterBinding.ensureInitialized();

  await setupsl();

  overrideNavColors();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ovest',
      debugShowCheckedModeBanner: false,
      navigatorKey: sl<NavigationService>().key,
      theme: ThemeData(
        primaryColor: SqinColors.primaryColor,
        primarySwatch: MaterialColor(
          0xff17DBA7,
          SqinColors.COLOR_SCRATCH,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: Routes.startUpView,
      onGenerateRoute: generateRoute,
    );
  }
}

/// Set StatusBar and NavigationBar Customization for android
void overrideNavColors() {
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      /// Set StatusBar Customization.
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,

      /// Set NavigationBar Customization.
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
  }

  /// Set DeviceOrientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
