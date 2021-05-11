import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sqin/ui/shared/base_view.dart';
import 'package:sqin/ui/shared/style/colors.dart';
import 'package:sqin/ui/shared/style/fonts.dart';
import 'package:sqin/ui/widgets/busy_button.dart';
import 'package:sqin/viewmodels/home_view_model.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: AgHeader('X'),
              onPressed: () => Navigator.pop(context),
            ),
            Gap(10),
          ],
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularPercentIndicator(
                        radius: 200.0,
                        lineWidth: 10.0,
                        percent: model.overAllPoint / 100,
                        backgroundColor: SqinColors.grayColor,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AgHeader(
                              '${model.overAllPoint} / 100',
                              color: Color(0xffF7ADB9),
                            ),
                            Gap(20),
                            AgSubHeader(
                              '+${model.recentAllPoint}',
                              color: Color(0xffFF1768A),
                            ),
                          ],
                        ),
                        progressColor: SqinColors.primaryColor,
                      ),
                      Gap(40),
                      AgSmallText(
                        'Level',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      Gap(20),
                      AgBodyText(
                        'Beauty Newbie',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                BusyButton(title: 'Continue', onPressed: () {}),
              ],
            ),
          ),
        ),
      );
    });
  }
}
