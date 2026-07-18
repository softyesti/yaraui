import 'dart:async';
import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:yaraui/src/domain/entities/window_settings.dart';
import 'package:yaraui/src/domain/enums/operating_system.dart';
import 'package:yaraui/src/utils/platform_util.dart';

part 'bitsdojo_window_service.dart';

/// Service to manage application window.
abstract class WindowService {
  /// Creates a new [WindowService].
  const WindowService();

  /// Creates a new [WindowService] with default implementation.
  /// https://pub.dev/packages/bitsdojo_window.
  const factory WindowService.create() = _BitsdojoWindowService;

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
