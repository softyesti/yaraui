import 'package:flutter/widgets.dart';

/// Entity that represents a window settings.
class WindowSettings {
  /// Creates a new [WindowSettings].
  const WindowSettings({
    required this.title,
    this.size = const Size(1280, 768),
    this.minSize = const Size(1024, 768),
    this.maxSize,
  });

  /// Window title.
  final String title;

  /// Window default size.
  final Size size;

  /// Window minimum size.
  final Size? minSize;

  /// Window maximum size.
  final Size? maxSize;
}
