part of 'theme.dart';

/// Represents the default theme data.
class DefaultThemeData extends ThemeData {
  /// Creates a new [DefaultThemeData].
  DefaultThemeData() : super(metrics: _metrics);

  static ThemeMetrics get _metrics => switch (PlatformUtil.operatingSystem) {
    .macos => const MacOSThemeMetrics(),
    .linux => const LinuxThemeMetrics(),
    .windows => const WindowsThemeMetrics(),
    _ => const DefaultThemeMetrics(),
  };
}
