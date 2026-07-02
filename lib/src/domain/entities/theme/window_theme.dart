part of 'theme_data.dart';

/// Represents window theme.
class WindowTheme {
  /// Creates a new [WindowTheme].
  const WindowTheme({
    required this.titleBar,
    required this.borderRadius,
  });

  /// Window title bar.
  final ThemeTitleBar titleBar;

  /// Window border radius.
  final BorderRadius borderRadius;
}

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
