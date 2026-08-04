// For legibility.
// ignore_for_file: avoid_redundant_argument_values

part of 'window_service.dart';

/// Default implementation of [WindowService].
class _DefaultWindowService extends WindowService with WindowListener {
  /// Default implementation of [WindowService].
  _DefaultWindowService._(super.settings) {
    _state = settings.state;
    _stateController = .broadcast();
  }

  late WindowState _state;
  late final StreamController<WindowState> _stateController;

  @override
  WindowState get state => _state;

  @override
  Stream<WindowState> get stateStream => _stateController.stream;

  @override
  Future<WindowService> init() async {
    await Future.wait([
      Window.initialize(),
      windowManager.ensureInitialized(),
    ]);

    await _setEffect();

    final options = WindowOptions(
      center: true,
      skipTaskbar: false,
      alwaysOnTop: false,
      size: settings.size,
      title: settings.title,
      titleBarStyle: .hidden,
      windowButtonVisibility: false,
      maximumSize: settings.maxSize,
      minimumSize: settings.minSize,
      fullScreen: _state == .fullscreen,
      backgroundColor: const Color(0x00000000),
    );

    windowManager.addListener(this);
    await windowManager.waitUntilReadyToShow(options, () async {
      await windowManager.show();
      await windowManager.focus();
      await switch (_state) {
        .maximized => windowManager.maximize(),
        .minimized => windowManager.minimize(),
        .windowed || .fullscreen => windowManager.show(),
      };
    });

    return this;
  }

  @override
  Future<void> dispose() async {
    windowManager.removeListener(this);
    await _stateController.close();
    return windowManager.destroy();
  }

  @override
  Future<void> show() async => windowManager.show();

  @override
  Future<void> hide() async => windowManager.hide();

  @override
  Future<void> close() async => windowManager.close();

  @override
  Future<void> drag() async => windowManager.startDragging();

  @override
  Future<void> restore() async => windowManager.restore();

  @override
  Future<void> minimize() async => windowManager.minimize();

  @override
  Future<void> maximize() async => windowManager.maximize();

  @override
  Future<void> unmaximize() async => windowManager.unmaximize();

  @override
  Future<void> maxOrRestore() async => switch (_state) {
    .maximized => unmaximize(),
    _ => maximize(),
  };

  @override
  Future<void> enterFullscreen() async => windowManager.setFullScreen(true);

  @override
  Future<void> exitFullscreen() async => windowManager.setFullScreen(false);

  @override
  Future<void> fullOrRestore() async => switch (_state) {
    .fullscreen => exitFullscreen(),
    _ => enterFullscreen(),
  };

  @override
  Future<void> showControls() async => windowManager.setTitleBarStyle(
    .hidden,
    windowButtonVisibility: true,
  );

  @override
  Future<void> hideControls() async => windowManager.setTitleBarStyle(
    .hidden,
    windowButtonVisibility: false,
  );

  @override
  void onWindowMaximize() {
    _state = .maximized;
    _stateController.add(_state);
  }

  @override
  void onWindowUnmaximize() {
    _state = .windowed;
    _stateController.add(_state);
  }

  @override
  Future<void> onWindowEnterFullScreen() async {
    _state = .fullscreen;
    _stateController.add(_state);
    if (PlatformUtil.operatingSystem == .macos) return showControls();
  }

  @override
  Future<void> onWindowLeaveFullScreen() async {
    _state = .windowed;
    _stateController.add(_state);
    if (PlatformUtil.operatingSystem == .macos) return hideControls();
  }

  Future<void> _setEffect() async {
    final brightness = PlatformDispatcher.instance.platformBrightness;
    await Future.wait([
      if (Platform.isMacOS) Window.enableFullSizeContentView(),
      windowManager.setBrightness(brightness),
      Window.setEffect(
        dark: brightness == .dark,
        effect: switch (PlatformUtil.operatingSystem) {
          .linux => .transparent,
          .macos || .windows => .acrylic,
          _ => throw _unsupportedError,
        },
      ),
    ]);
  }
}
