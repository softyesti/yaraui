part of 'default_theme_data.dart';

/// Represents macOS theme.
class MacOSThemeData extends DefaultThemeData {
  /// Creates a new [MacOSThemeData].
  const MacOSThemeData({
    super.window = const .new(
      padding: .all(4),
      borderRadius: .all(.circular(18)),
      titleBar: .new(
        height: 54,
        padding: .symmetric(horizontal: 20),
      ),
    ),
  });
}
