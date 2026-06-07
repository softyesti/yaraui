import 'package:flutter/widgets.dart';
import 'package:yaraui/src/domain/entities/theme/theme_data.dart';
import 'package:yaraui/src/theme/metrics/default_theme_metrics.dart';
import 'package:yaraui/src/utils/platform_util.dart';

part 'default_theme_data.dart';

/// An inherited widget that provides [ThemeData] to its descendants.
class Theme extends InheritedWidget {
  /// Creates a new [Theme].
  const Theme({
    required this._data,
    required super.child,
    super.key,
  });

  final ThemeData _data;

  @override
  bool updateShouldNotify(covariant Theme old) {
    return _data != old._data;
  }

  /// Returns the [ThemeData] from the closest [Theme] ancestor.
  static ThemeData of(BuildContext context) {
    final theme = context.dependOnInheritedWidgetOfExactType<Theme>();
    if (theme == null) {
      throw Exception('No Theme found in context');
    }

    return theme._data;
  }
}
