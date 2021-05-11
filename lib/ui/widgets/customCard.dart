import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:sqin/ui/shared/style/colors.dart';
import 'package:sqin/ui/shared/style/fonts.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key key,
    this.image,
    this.text,
  }) : super(key: key);
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: SqinColors.grayColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              child:
                  text != null ? SvgPicture.asset(image) : Image.asset(image),
            ),
          ),
          Gap(8),
          text != null
              ? AgButtontext(
                  '$text',
                  color: SqinColors.textColor,
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
