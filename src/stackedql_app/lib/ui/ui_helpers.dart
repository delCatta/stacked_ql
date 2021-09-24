import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny =
    ExcludeSemantics(child: SizedBox(width: 5.0));
const Widget horizontalSpaceSmall =
    ExcludeSemantics(child: SizedBox(width: 10.0));
const Widget horizontalSpaceRegular =
    ExcludeSemantics(child: SizedBox(width: 18.0));
const Widget horizontalSpaceMedium =
    ExcludeSemantics(child: SizedBox(width: 25.0));
const Widget horizontalSpaceLarge =
    ExcludeSemantics(child: SizedBox(width: 50.0));

const Widget verticalSpaceTiny = ExcludeSemantics(child: SizedBox(height: 5.0));
const Widget verticalSpaceSmall =
    ExcludeSemantics(child: SizedBox(height: 10.0));
const Widget verticalSpaceRegular =
    ExcludeSemantics(child: SizedBox(height: 18.0));
const Widget verticalSpaceMedium =
    ExcludeSemantics(child: SizedBox(height: 25.0));
const Widget verticalSpaceLarge =
    ExcludeSemantics(child: SizedBox(height: 50.0));

// Screen Size helpers

double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) =>
    screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) =>
    screenWidth(context) * percentage;
