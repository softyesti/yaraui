import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:window_manager/window_manager.dart';
import '../../domain/entities/window_settings.dart';
import '../../domain/enums/window_state.dart';
import '../../utils/platform_util.dart';

part 'default_window_service.dart';

/// Service to manage application window.
abstract class WindowService {
  /// Service to manage application window.
  const WindowService(this.settings);

  /// Creates a new [WindowService] with default implementation.
  factory WindowService.create(
    WindowSettings settings,
  ) = _DefaultWindowService._;

  /// Window settings.
  final WindowSettings settings;

  /// Returns the window state.
  WindowState get state;

  /// Returns the window state stream.
  Stream<WindowState> get stateStream;

  /// Initializes the window service.
  Future<WindowService> init();

  /// Disposes the window service.
  Future<void> dispose();

  /// Shows the window.
  Future<void> show();

  /// Hides the window.
  Future<void> hide();

  /// Close the window.
  Future<void> close();

  /// Start dragging the window.
  Future<void> drag();

  /// Restore the window to initial state.
  Future<void> restore();

  /// Minimizes the window.
  Future<void> minimize();

  /// Maximizes the window.
  Future<void> maximize();

  /// Unmaximizes the window.
  Future<void> unmaximize();

  /// Maximizes the window or restore if its maximized.
  Future<void> maxOrRestore();

  /// Enter full-screen mode.
  Future<void> enterFullscreen();

  /// Exits full-screen mode.
  Future<void> exitFullscreen();

  /// Enter full-screen mode or exit it if you're already in that mode.
  Future<void> fullOrRestore();

  /// Hides the window controls.
  Future<void> hideControls();

  /// Shows the window controls.
  Future<void> showControls();
}

final _unsupportedError = UnsupportedError(
  'Unsupported platform: ${PlatformUtil.operatingSystem}',
);
