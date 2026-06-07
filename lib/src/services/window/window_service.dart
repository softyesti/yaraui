import 'dart:async';

import 'package:yaraui/src/domain/entities/window_settings.dart';
import 'package:yaraui/src/services/window/bitsdojo_window_service.dart';

/// Service to manage application window.
abstract class WindowService {
  /// Creates a new [WindowService].
  const WindowService();

  /// Creates a new [WindowService] with default implementation.
  factory WindowService.create() => const BitsdojoWindowService();

  /// Initializes the window service.
  Future<WindowService> init(WindowSettings settings);

  /// Disposes the window service.
  Future<void> dispose();

  /// Open the window.
  Future<void> open();

  /// Close the window.
  Future<void> close();

  /// Hides the window.
  Future<void> hide();

  /// Restore the window to initial state.
  Future<void> restore();

  /// Minimizes the window.
  Future<void> minimize();

  /// Maximizes the window.
  Future<void> maximize();

  /// Fullscreens the window.
  Future<void> fullscreen();

  /// Maximizes the window or restore if its maximized.
  Future<void> maxOrRestore();

  /// Fullscreens the window or restore if its fullscreened.
  Future<void> fullOrRestore();

  /// Start dragging the window.
  Future<void> drag();
}
