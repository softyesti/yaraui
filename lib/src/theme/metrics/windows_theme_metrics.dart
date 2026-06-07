part of 'default_theme_metrics.dart';

/// Represents Windows theme metrics.
class WindowsThemeMetrics extends DefaultThemeMetrics {
  /// Creates a new [WindowsThemeMetrics].
  const WindowsThemeMetrics({
    super.titleBar = const ThemeMetricsTitleBar(height: 32, padding: .zero),
  });
}
