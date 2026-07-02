part of 'default_theme_data.dart';

/// Represents macOS theme.
class MacOSThemeData extends DefaultThemeData {
  /// Creates a new [MacOSThemeData].
  const MacOSThemeData({
    super.titleBar = const .new(
      height: 54,
      padding: .symmetric(horizontal: 20),
    ),
  });
}
