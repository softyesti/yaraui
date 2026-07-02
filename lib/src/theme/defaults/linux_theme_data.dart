part of 'default_theme_data.dart';

/// Represents Linux theme.
class LinuxThemeData extends DefaultThemeData {
  /// Creates a new [LinuxThemeData].
  const LinuxThemeData({
    super.window = const .new(
      borderRadius: .all(.circular(12)),
      titleBar: .new(
        height: 32,
        padding: .symmetric(horizontal: 20),
      ),
    ),
  });
}
