import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get success;
  Color get danger;
  Color get white;
  Color get grey;
}

class AppColors implements IAppColors {
  @override
  Color get success => const Color(0xFF5DB075);

  @override
  Color get danger => const Color(0xFFDE5000);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get grey => const Color(0xFFE8E8E8);
}
