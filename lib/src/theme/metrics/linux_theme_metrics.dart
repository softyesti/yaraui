part of 'default_theme_metrics.dart';

/// Represents Linux theme metrics.
class LinuxThemeMetrics extends DefaultThemeMetrics {
  /// Creates a new [LinuxThemeMetrics].
  const LinuxThemeMetrics({
    super.titleBar = const ThemeMetricsTitleBar(
      height: 32,
      padding: .symmetric(horizontal: 20),
    ),
  });
}
