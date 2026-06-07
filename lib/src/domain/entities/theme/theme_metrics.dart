part of 'theme_data.dart';

/// Represents theme metrics.
class ThemeMetrics {
  /// Creates a new [ThemeMetrics].
  const ThemeMetrics({
    required this.radius,
    required this.spacing,
    required this.titleBar,
  });

  /// Radius metrics.
  final ThemeMetricsRadius radius;

  /// Spacing metrics.
  final ThemeMetricsSpacing spacing;

  /// Title bar metrics.
  final ThemeMetricsTitleBar titleBar;
}

/// Represents theme spacing metrics.
class ThemeMetricsSpacing {
  /// Creates a new [ThemeMetricsSpacing].
  const ThemeMetricsSpacing({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
    required this.xl,
  });

  /// Extra small spacing.
  final double xs;

  /// Small spacing.
  final double sm;

  /// Medium spacing.
  final double md;

  /// Large spacing.
  final double lg;

  /// Extra large spacing.
  final double xl;
}

/// Represents theme radius metrics.
class ThemeMetricsRadius {
  /// Creates a new [ThemeMetricsRadius].
  const ThemeMetricsRadius({
    required this.sm,
    required this.md,
    required this.lg,
  });

  /// Small spacing.
  final Radius sm;

  /// Medium spacing.
  final Radius md;

  /// Large spacing.
  final Radius lg;
}

/// Represents theme title bar metrics.
class ThemeMetricsTitleBar {
  /// Creates a new [ThemeMetricsTitleBar].
  const ThemeMetricsTitleBar({
    required this.height,
    required this.padding,
  });

  /// Title bar height.
  final double height;

  /// Title bar padding.
  final EdgeInsets padding;
}
