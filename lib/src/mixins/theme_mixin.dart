import 'package:flutter/widgets.dart';
import 'package:yaraui/src/domain/entities/theme/theme_data.dart';
import 'package:yaraui/src/theme/theme.dart';

/// A mixin that provides access to the current [ThemeData] and its properties.
mixin ThemeMixin {
  /// Returns the [ThemeData] from the closest [Theme] ancestor.
  ThemeData getTheme(BuildContext context) => Theme.of(context);

  /// Returns the [ThemeMetrics] from the closest [Theme] ancestor.
  ThemeMetrics getThemeMetrics(
    BuildContext context,
  ) => getTheme(context).metrics;
}
