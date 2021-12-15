import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class IAppTextStyles {
  TextStyle get label;
  TextStyle get input;
  TextStyle get buttonBackgroundColor;
  TextStyle get buttonTextColor;
}

class AppTextStyles implements IAppTextStyles {
  @override
  TextStyle get label => GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  @override
  // TODO: implement buttonBackgroundColor
  TextStyle get buttonBackgroundColor => throw UnimplementedError();

  @override
  // TODO: implement buttonTextColor
  TextStyle get buttonTextColor => throw UnimplementedError();

  @override
  // TODO: implement input
  TextStyle get input => throw UnimplementedError();
}
