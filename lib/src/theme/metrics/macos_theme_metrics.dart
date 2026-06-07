part of 'default_theme_metrics.dart';

/// Represents macOS theme metrics.
class MacOSThemeMetrics extends DefaultThemeMetrics {
  /// Creates a new [MacOSThemeMetrics].
  const MacOSThemeMetrics({
    super.titleBar = const ThemeMetricsTitleBar(
      height: 54,
      padding: .symmetric(horizontal: 20),
    ),
  });
}
