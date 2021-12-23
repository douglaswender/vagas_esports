import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class BottomSheetLoading extends StatelessWidget {
  const BottomSheetLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.colors.green,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
      ),
      height: 200,
      child: Center(
        child: CircularProgressIndicator(
          color: AppTheme.colors.white,
        ),
      ),
    );
  }
}
