import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final Widget horizontalSpaceTiny = Gap(5);
final Widget horizontalSpaceSmall = Gap(10);
final Widget horizontalSpaceMedium = Gap(25);

final Widget gapTiny = Gap(5);
final Widget gapSmall = Gap(10);
final Widget gapMedium = Gap(25);
final Widget gapLarge = Gap(50);
final Widget gapMassive = Gap(120);

Widget spacedDivider = Column(
  children: [
    gapMedium,
    Divider(
      color: Colors.blueGrey,
      height: 5,
    ),
    gapMedium,
  ],
);
