part of 'theme_data.dart';

/// Represents window title bar theme.
class ThemeTitleBar {
  /// Creates a new [ThemeTitleBar].
  const ThemeTitleBar({
    required this.height,
    required this.padding,
  });

  /// Title bar height.
  final double height;

  /// Title bar padding.
  final EdgeInsets padding;
}
