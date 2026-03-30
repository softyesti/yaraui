import 'dart:async';
import 'dart:io';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:yaraui/src/domain/window_entity.dart';
import 'package:yaraui/src/services/window/window_service.dart';

/// Bitsdojo package implementation of [WindowService].
class BitsdojoWindowService extends WindowService {
  /// Creates a new [BitsdojoWindowService].
  const BitsdojoWindowService();

  @override
  FutureOr<WindowService> init(WindowSettings settings) async {
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
  FutureOr<void> dispose() => appWindow.close;

  @override
  FutureOr<void> open() => appWindow.show;

  @override
  FutureOr<void> close() => appWindow.close;

  @override
  FutureOr<void> hide() => appWindow.hide;

  @override
  FutureOr<void> restore() => appWindow.restore;

  @override
  FutureOr<void> minimize() => appWindow.minimize;

  @override
  FutureOr<void> maximize() => appWindow.maximize;

  @override
  FutureOr<void> maxOrRestore() => appWindow.maximizeOrRestore;

  Future<void> _hideControls() async => Future.wait([
    Window.hideWindowControls(),
    if (Platform.isMacOS) Window.hideZoomButton(),
    if (Platform.isMacOS) Window.hideCloseButton(),
    if (Platform.isMacOS) Window.hideMiniaturizeButton(),
    if (Platform.isMacOS) Window.enableFullSizeContentView(),
  ]);

  Future<void> _setEffect() async => Window.setEffect(
    dark: PlatformDispatcher.instance.platformBrightness == .dark,
    effect: switch (Platform.operatingSystem) {
      'macos' => .mica,
      'windows' => .tabbed,
      'linux' => .transparent,
      String() => throw UnsupportedError(''),
    },
  );
}
