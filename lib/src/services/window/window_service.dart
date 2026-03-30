import 'dart:async';

import 'package:yaraui/src/domain/window_entity.dart';
import 'package:yaraui/src/services/window/bitsdojo_window_service.dart';

/// Service to manage application window.
abstract class WindowService {
  /// Creates a new [WindowService].
  const WindowService();

  /// Creates a new [WindowService] with default implementation.
  factory WindowService.create() => const BitsdojoWindowService();

  /// Initializes the window service.
  FutureOr<WindowService> init(WindowSettings settings);

  /// Disposes the window service.
  FutureOr<void> dispose();

  /// Open the window.
  FutureOr<void> open();

  /// Close the window.
  FutureOr<void> close();

  /// Hides the window.
  FutureOr<void> hide();

  /// Restore the window to initial state.
  FutureOr<void> restore();

  /// Minimizes the window.
  FutureOr<void> minimize();

  /// Maximizes the window.
  FutureOr<void> maximize();

  /// Maximizes the window or restore if its maximized.
  FutureOr<void> maxOrRestore();
}
