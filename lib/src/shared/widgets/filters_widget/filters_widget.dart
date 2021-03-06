import 'package:flutter/material.dart';
import 'package:vagas_esports/src/shared/theme/app_theme.dart';
import 'package:vagas_esports/src/shared/widgets/checkbox/checkbox.dart';
import 'package:vagas_esports/src/shared/widgets/filters_widget/filters_controller.dart';

import 'checkbox_item.dart';

class FiltersWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final FiltersController controller;

  final List<CheckboxItem> options;

  const FiltersWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.options,
    required this.controller,
  }) : super(key: key);

  @override
  _FiltersWidgetState createState() => _FiltersWidgetState();
}

class _FiltersWidgetState extends State<FiltersWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppTheme.sizes.s16),
      height: 180,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppTheme.colors.greyInput,
        borderRadius: BorderRadius.all(
          Radius.circular(40.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title),
          Expanded(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                ...widget.options.map((e) => CheckBox(
                      label: e.label,
                      selected: e.selected,
                      onSelect: () => widget.controller.addSelectedItem(e),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
