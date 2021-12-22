import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class ButtonSecondary extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const ButtonSecondary({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(AppTheme.colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTheme.textStyles.buttonSecondary),
      ),
    );
  }
}
