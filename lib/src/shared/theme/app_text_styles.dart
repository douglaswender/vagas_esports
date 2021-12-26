import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

abstract class IAppTextStyles {
  TextStyle get label;
  TextStyle get input;
  TextStyle get header;
  TextStyle get buttonPrimary;
  TextStyle get buttonSecondary;
  TextStyle get labelGreen;
  TextStyle get title;
}

class AppTextStyles implements IAppTextStyles {
  @override
  TextStyle get label => GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      );

  @override
  TextStyle get buttonPrimary => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.white,
        fontSize: 16,
      );

  @override
  TextStyle get buttonSecondary => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.green,
        fontSize: 16,
      );

  @override
  TextStyle get input => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        color: AppTheme.colors.black,
        fontSize: 16,
      );

  @override
  TextStyle get header => GoogleFonts.inter(
        fontWeight: FontWeight.w600,
        fontSize: 30,
      );

  @override
  TextStyle get labelGreen => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppTheme.colors.green,
      );

  @override
  TextStyle get title => GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        color: AppTheme.colors.black,
      );
}
