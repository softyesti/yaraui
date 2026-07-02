import 'dart:async';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:yaraui/src/domain/entities/window_settings.dart';
import 'package:yaraui/src/domain/enums/operating_system.dart';
import 'package:yaraui/src/services/window/window_service.dart';
import 'package:yaraui/src/utils/platform_util.dart';

/// Bitsdojo package implementation of [WindowService].
class BitsdojoWindowService extends WindowService {
  /// Creates a new [BitsdojoWindowService].
  const BitsdojoWindowService();

  @override
  Future<WindowService> init(WindowSettings settings) async {
    await Window.initialize();
    await Future.wait([_setEffect(), _hideControls()]);

    doWhenWindowReady(() {
      appWindow.alignment = .center;
      appWindow.title = settings.title;
      appWindow.size = settings.size;
      appWindow.minSize = settings.minSize;
      appWindow.maxSize = settings.maxSize;
      appWindow.show();
    });

    return this;
  }

  @override
  Future<void> dispose() async => appWindow.close();

  @override
  Future<void> open() async => appWindow.show();

  @override
  Future<void> close() async => appWindow.close();

  @override
  Future<void> hide() async => appWindow.hide();

  @override
  Future<void> restore() async => appWindow.restore();

  @override
  Future<void> minimize() async => appWindow.minimize();

  @override
  Future<void> maximize() async => appWindow.maximize();

  @override
  Future<void> fullscreen() async => Window.enterFullscreen();

  @override
  Future<void> maxOrRestore() async => appWindow.maximizeOrRestore();

  @override
  Future<void> fullOrRestore() async => switch (PlatformUtil.operatingSystem) {
    .macos => switch (await Window.isWindowFullscreened()) {
      true => Window.exitFullscreen(),
      false => Window.enterFullscreen(),
    },
    OperatingSystem() => throw UnsupportedError(
      'Unsupported platform: ${PlatformUtil.operatingSystem}',
    ),
  };

  @override
  Future<void> drag() async => appWindow.startDragging();

  Future<void> _hideControls() async => Future.wait([
    Window.hideWindowControls(),
    if (Platform.isMacOS) Window.hideZoomButton(),
    if (Platform.isMacOS) Window.hideCloseButton(),
    if (Platform.isMacOS) Window.hideMiniaturizeButton(),
    if (Platform.isMacOS) Window.enableFullSizeContentView(),
  ]);

  Future<void> _setEffect() async => Window.setEffect(
    dark: PlatformDispatcher.instance.platformBrightness == .dark,
    effect: switch (PlatformUtil.operatingSystem) {
      .linux => .transparent,
      .macos || .windows => .acrylic,
      OperatingSystem() => throw UnsupportedError(
        'Unsupported platform: ${PlatformUtil.operatingSystem}',
      ),
    },
  );
}
