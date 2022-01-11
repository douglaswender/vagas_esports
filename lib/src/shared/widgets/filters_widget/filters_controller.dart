import 'package:vagas_esports/src/shared/widgets/filters_widget/checkbox_item.dart';

class FiltersController {
  final List<CheckboxItem> allOptions;
  List<CheckboxItem>? selectedValues = [];

  FiltersController({required this.allOptions});

  List<CheckboxItem>? get allSelectedItems => selectedValues;

  void addSelectedItem(CheckboxItem item) {
    selectedValues!.add(item);
  }

  void removeSelectedItem(CheckboxItem item) {
    selectedValues!.remove(item);
  }
}
