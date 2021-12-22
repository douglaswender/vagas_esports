import 'package:vagas_esports/src/shared/theme/app_sizes.dart';

import 'app_colors.dart';
import 'app_text_styles.dart';

export 'app_text.dart';

class AppTheme {
  static final AppTheme instance = AppTheme();

  final _colors = AppColors();
  static AppColors get colors => instance._colors;

  final _textStyles = AppTextStyles();
  static AppTextStyles get textStyles => instance._textStyles;

  final _sizes = AppSizes();
  static AppSizes get sizes => instance._sizes;
}
