part of 'default_theme_data.dart';

/// Represents Linux theme.
class LinuxThemeData extends DefaultThemeData {
  /// Creates a new [LinuxThemeData].
  const LinuxThemeData({
    super.window = const .new(
      borderRadius: .all(.circular(16)),
      titleBar: .new(
        height: 46,
        padding: .symmetric(horizontal: 14),
      ),
    ),
  });
}
