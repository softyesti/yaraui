part of 'default_theme_data.dart';

/// Represents Windows theme.
class WindowsThemeData extends DefaultThemeData {
  /// Creates a new [WindowsThemeData].
  const WindowsThemeData({
    super.titleBar = const .new(
      height: 32,
      padding: .symmetric(horizontal: 20),
    ),
  });
}
