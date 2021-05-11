import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sqin/constant/appAssets.dart';
import 'package:sqin/ui/shared/base_view.dart';
import 'package:sqin/ui/shared/style/colors.dart';
import 'package:sqin/ui/shared/style/fonts.dart';
import 'package:sqin/ui/widgets/busy_button.dart';
import 'package:sqin/ui/widgets/customCard.dart';
import 'package:sqin/viewmodels/home_view_model.dart';

class HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(builder: (context, model, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacer(),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset(AppAssets.logoPNG),
                    ),
                    Spacer(),
                    IconButton(icon: AgHeader('X'), onPressed: null),
                  ],
                ),
                Gap(50),
                Expanded(
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 27.0 / 25.0,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
                    children: [
                      CustomCard(
                        image: AppAssets.four,
                        text: '4 Points',
                      ),
                      CustomCard(
                        image: AppAssets.ten,
                        text: '10 Points',
                      ),
                      CustomCard(
                        image: AppAssets.twenty1,
                        text: '10 Points',
                      ),
                      CustomCard(
                        image: AppAssets.seven,
                        text: '7 Points',
                      ),
                      CustomCard(
                        image: AppAssets.coupon,
                      ),
                      CustomCard(
                        image: AppAssets.twenty2,
                        text: '20 Points',
                      ),
                    ],
                  ),
                ),
                BusyButton(
                  title: 'Start',
                  onPressed: () {
                    int value = model.generateNumber();
                    showDialog(
                      context: context,
                      builder: (contx) => model.list[value] == 100
                          ? CouponModal(
                              onTap: () {
                                model.addPoint(model.list[value]);
                              },
                            )
                          : PointModal(
                              point: model.list[value],
                              onTap: () {
                                model.addPoint(model.list[value]);
                              },
                            ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class CouponModal extends StatelessWidget {
  const CouponModal({Key key, this.onTap}) : super(key: key);

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                    image: AssetImage(AppAssets.coupon), fit: BoxFit.cover),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: AgHeader('X'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Gap(20),
                  AgButtontext(
                    'You won a digital coupon!',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Gap(8),
                  AgBodyText(
                    'You won a digital coupon code for\nthe NIQA store. Congratulations!',
                    textAlign: TextAlign.center,
                  ),
                  Gap(20),
                  AgBodyText(
                    '7Zb8o6R',
                    color: SqinColors.textColor,
                  ),
                  Gap(20),
                  BusyButton(title: 'Go to the NIQA store', onPressed: onTap),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PointModal extends StatelessWidget {
  const PointModal({Key key, this.point, this.onTap}) : super(key: key);
  final int point;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    String image;
    switch (point) {
      case 4:
        image = AppAssets.four;
        break;
      case 10:
        image = AppAssets.ten;
        break;
      case 7:
        image = AppAssets.seven;
        break;
      case 20:
        image = AppAssets.twenty1;
        break;
      default:
    }
    return Dialog(
      child: Container(
        height: 400,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Stack(
                children: [
                  SvgPicture.asset(image),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: AgHeader('X'),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Gap(20),
                  AgButtontext(
                    'You won $point level points!',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  Gap(8),
                  AgBodyText(
                    'Your star account grows. Keep collecting and\nlook forward to great products.',
                    textAlign: TextAlign.center,
                  ),
                  Gap(20),
                  BusyButton(title: 'Collect stars', onPressed: onTap),
                  Gap(30),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
