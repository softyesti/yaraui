import 'package:flutter/widgets.dart';

part 'window_theme.dart';
part 'theme_spacing.dart';

/// Represents theme data.
class ThemeData {
  /// Creates a new [ThemeData].
  const ThemeData({
    required this.window,
    required this.spacing,
  });

  /// Window theme.
  final WindowTheme window;

  /// Theme spacing.
  final ThemeSpacing spacing;
}
