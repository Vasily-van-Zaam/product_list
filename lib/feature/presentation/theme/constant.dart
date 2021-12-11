import 'package:flutter/material.dart';

//// CORORS /////////////////////////////////////
Color onPrinaryColor = Colors.white;
Color buttonPrymaryColor = Colors.blue;

Color lightSelectedItemColor = Colors.blue;
Color lightUnSelectedItemColor = const Color.fromARGB(180, 18, 18, 18);
Color lightBlockColor = Colors.white;
Color lightTextColorOnDarkColor = Colors.white;
Color lightOnBlockColor = Colors.black;
Color errorColor = Colors.red;
Color lightBorderColor = Colors.black;
Color lightHoverBorderColor = Colors.blue;

Color lightInputFillColor = const Color.fromRGBO(244, 246, 250, 1);
Color lightBackgroundNavBottomColor = const Color.fromRGBO(244, 246, 250, 1);
Color disabledColor = Colors.grey;

//// GRADIENTS //////////////////////////////////
LinearGradient lightGradientBackgroundScaffold = const LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Colors.black, Colors.blue]);

//// OTHER /////////////////////////////////////
double inputRadius = 20;
BorderRadius bordeRadius = BorderRadius.all(
  Radius.circular(inputRadius),
);

var inputContentPadding = const EdgeInsets.fromLTRB(20, 20, 20, 20);
var inputContentPaddingMoreLeft = const EdgeInsets.fromLTRB(55, 20, 20, 20);
var inputContentPaddingMoreRight = const EdgeInsets.fromLTRB(20, 20, 55, 20);
var buttonBoxShadow = [
  BoxShadow(
      color: Colors.blue.shade100,
      // spreadRadius: 25,
      blurRadius: 20,
      offset: const Offset(0, 12))
];

var boxDecoration = BoxDecoration(
  color: lightBlockColor,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(40),
    topRight: Radius.circular(40),
  ),
);

var boxDecorationItemList = const BoxDecoration(
  border: Border(
    bottom: BorderSide(
      width: 1,
      color: Color.fromRGBO(16, 44, 70, 0.1),
    ),
  ),
);
