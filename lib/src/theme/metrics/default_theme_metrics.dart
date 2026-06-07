import 'package:yaraui/src/domain/entities/theme/theme_data.dart';

part 'linux_theme_metrics.dart';
part 'macos_theme_metrics.dart';
part 'windows_theme_metrics.dart';

/// Represents default theme metrics.
class DefaultThemeMetrics extends ThemeMetrics {
  /// Creates a new [DefaultThemeMetrics].
  const DefaultThemeMetrics({
    super.titleBar = const ThemeMetricsTitleBar(
      height: 0,
      padding: .zero,
    ),
    super.radius = const ThemeMetricsRadius(
      sm: .circular(8),
      md: .circular(16),
      lg: .circular(24),
    ),
    super.spacing = const ThemeMetricsSpacing(
      xs: 4,
      sm: 8,
      md: 16,
      lg: 24,
      xl: 32,
    ),
  });
}
