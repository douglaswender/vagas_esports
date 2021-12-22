import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final bool isPassword;

  const InputText({
    Key? key,
    required this.label,
    this.hint,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppTheme.sizes.s16, horizontal: AppTheme.sizes.s32),
          child: TextField(
            style: AppTheme.textStyles.input,
            decoration: InputDecoration(
              labelText: label,
              hintStyle: AppTheme.textStyles.input,
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.colors.green),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppTheme.colors.green),
              ),
            ),
            obscureText: isPassword,
          ),
        ),
      ],
    );
  }
}
