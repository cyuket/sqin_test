import 'package:flutter/material.dart';
import 'package:sqin/constant/appAssets.dart';
import 'package:sqin/ui/shared/base_view.dart';
import 'package:sqin/viewmodels/start_view_model.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<StartViewModel>(
        onModelReady: (model) => model.handleStartUpLogic(),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset(AppAssets.logoPNG),
              ),
            ),
          );
        });
  }
}
