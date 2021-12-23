import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;

  const InputText({
    Key? key,
    required this.label,
    this.hint,
    this.obscure = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: AppTheme.sizes.s16, horizontal: AppTheme.sizes.s32),
          child: TextFormField(
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            onChanged: onChanged,
            validator: (value) {
              if (validator != null) {
                return validator!(value ?? "");
              }
            },
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
            obscureText: obscure,
          ),
        ),
      ],
    );
  }
}
