import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';

class CheckBox extends StatefulWidget {
  final String label;
  const CheckBox({Key? key, required this.label}) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 16,
          width: 16,
          decoration: BoxDecoration(
              border: Border.all(color: AppTheme.colors.green),
              borderRadius: BorderRadius.all(Radius.circular(5))),
        ),
        SizedBox(
          width: AppTheme.sizes.s8,
        ),
        Text(widget.label, style: AppTheme.textStyles.label),
        SizedBox(
          width: AppTheme.sizes.s8,
        ),
      ],
    );
  }
}
