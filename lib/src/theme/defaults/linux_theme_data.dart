part of 'default_theme_data.dart';

/// Represents Linux theme.
class LinuxThemeData extends DefaultThemeData {
  /// Creates a new [LinuxThemeData].
  const LinuxThemeData({
    super.titleBar = const .new(
      height: 32,
      padding: .symmetric(horizontal: 20),
    ),
  });
}
