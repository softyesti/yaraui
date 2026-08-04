import 'package:flutter/widgets.dart';
import '../enums/window_state.dart';

/// Represents the window settings.
class WindowSettings {
  /// Represents the window settings.
  const WindowSettings({
    required this.title,
    this.state = .windowed,
    this.size = const Size(1280, 768),
    this.minSize = const Size(1024, 768),
    this.maxSize,
  });

  /// Window title.
  final String title;

  /// Window state.
  final WindowState state;

  /// Window default size.
  final Size size;

  /// Window minimum size.
  final Size? minSize;

  /// Window maximum size.
  final Size? maxSize;
}
