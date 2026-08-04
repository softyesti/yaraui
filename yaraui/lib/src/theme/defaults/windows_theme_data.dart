part of 'default_theme_data.dart';

/// Represents Windows theme.
class WindowsThemeData extends DefaultThemeData {
  /// Creates a new [WindowsThemeData].
  const WindowsThemeData({
    super.window = const .new(
      padding: .all(4),
      borderRadius: .all(.circular(8)),
      titleBar: .new(
        height: 32,
        padding: .zero,
      ),
    ),
  });
}
