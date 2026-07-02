import 'package:flutter/widgets.dart';

part 'window_theme.dart';
part 'theme_spacing.dart';

/// Represents theme data.
class ThemeData {
  /// Creates a new [ThemeData].
  const ThemeData({
    required this.spacing,
    required this.titleBar,
  });

  /// Theme spacing.
  final ThemeSpacing spacing;

  /// Title bar theme.
  final ThemeTitleBar titleBar;
}
