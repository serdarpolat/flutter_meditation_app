import 'package:flutter/material.dart';

Color white = Colors.white;
Color black = Colors.black;
Color darkPurple = Color(0xFF2D31AC);
Color blue = Color(0xFF2D73D5);
Color teal = Color(0xFF44AFE3);
Color orange = Color(0xFFFEA171);
Color blueText = Color(0xFF4A80F0);
Color gray = Color(0xFFD0D0D0);
Color lightGray = Color(0xFFBBC1C8);

double hh(double size) => (size * 960) / 812;
double ww(double size) => (size * 454.73684) / 375;

TextStyle light15({Color color}) => TextStyle(
      color: color,
      fontSize: hh(15),
      fontWeight: FontWeight.w300,
    );

TextStyle reg24({Color color}) => TextStyle(
      color: color,
      fontSize: hh(24),
      fontWeight: FontWeight.w400,
    );

TextStyle reg12({Color color}) => TextStyle(
      color: color,
      fontSize: hh(12),
      fontWeight: FontWeight.w400,
    );

TextStyle reg16({Color color}) => TextStyle(
      color: color,
      fontSize: hh(16),
      fontWeight: FontWeight.w400,
    );

TextStyle reg17({Color color}) => TextStyle(
      color: color,
      fontSize: hh(17),
      fontWeight: FontWeight.w400,
    );

TextStyle med16({Color color}) => TextStyle(
      color: color,
      fontSize: hh(16),
      fontWeight: FontWeight.w500,
    );

TextStyle med24({Color color}) => TextStyle(
      color: color,
      fontSize: hh(24),
      fontWeight: FontWeight.w500,
    );

TextStyle semi13({Color color}) => TextStyle(
      color: color,
      fontWeight: FontWeight.w600,
      fontSize: hh(13),
    );

TextStyle semi28({Color color}) => TextStyle(
      color: color,
      fontSize: hh(28),
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );

TextStyle semi30({Color color}) => TextStyle(
      color: color,
      fontSize: hh(30),
      fontWeight: FontWeight.w600,
      letterSpacing: 1,
    );
