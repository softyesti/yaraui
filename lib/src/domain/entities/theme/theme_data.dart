import 'package:flutter/widgets.dart';

part 'theme_metrics.dart';

/// Represents theme data.
class ThemeData {
  /// Creates a new [ThemeData].
  const ThemeData({
    required this.metrics,
  });

  /// Theme metrics.
  final ThemeMetrics metrics;
}
