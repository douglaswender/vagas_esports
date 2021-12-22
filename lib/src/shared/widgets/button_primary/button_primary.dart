import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class ButtonPrimary extends StatelessWidget {
  final Function() onPressed;
  final String text;
  const ButtonPrimary({
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
          backgroundColor: MaterialStateProperty.all(AppTheme.colors.green),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          )),
        ),
        onPressed: onPressed,
        child: Text(text, style: AppTheme.textStyles.buttonPrimary),
      ),
    );
  }
}
