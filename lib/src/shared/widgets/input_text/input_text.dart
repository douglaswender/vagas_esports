import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class InputText extends StatelessWidget {
  final String label;
  final String? hint;
  final bool obscure;
  final void Function(String)? onChanged;
  final String? Function(String)? validator;
  final IconData? suffixIcon;
  final void Function()? onSuffixIconTap;
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
    this.suffixIcon,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
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
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onSuffixIconTap,
                    child: Icon(suffixIcon!),
                  )
                : null,
            hintStyle: AppTheme.textStyles.input,
            labelStyle: AppTheme.textStyles.label,
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.green),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.green),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.green),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppTheme.colors.green),
            ),
          ),
          obscureText: obscure,
        ),
      ],
    );
  }
}
