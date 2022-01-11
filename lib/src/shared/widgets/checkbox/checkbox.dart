import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/checkbox_item.dart';

class CheckBox extends StatefulWidget {
  final String label;
  final bool? selected;
  final void Function() onSelect;

  const CheckBox({
    Key? key,
    required this.label,
    this.selected = false,
    required this.onSelect,
  }) : super(key: key);

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  late bool selection;

  @override
  void initState() {
    super.initState();
    selection = widget.selected!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selection = !selection;
              widget.onSelect();
            });
          },
          child: Container(
            height: 16,
            width: 16,
            decoration: selection
                ? BoxDecoration(
                    border: Border.all(color: AppTheme.colors.green),
                    color: AppTheme.colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  )
                : BoxDecoration(
                    border: Border.all(color: AppTheme.colors.green),
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
          ),
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
