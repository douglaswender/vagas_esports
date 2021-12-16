import 'package:flutter/material.dart';

abstract class IAppColors {
  Color get green;
  Color get red;
  Color get white;
  Color get grey;
  Color get greyInput;
}

class AppColors implements IAppColors {
  @override
  Color get green => const Color(0xFF5DB075);

  @override
  Color get red => const Color(0xFFDE5000);

  @override
  Color get white => const Color(0xFFFFFFFF);

  @override
  Color get grey => const Color(0xFFE8E8E8);

  @override
  Color get greyInput => const Color(0xFFBDBDBD);
}
