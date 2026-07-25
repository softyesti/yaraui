part of 'window.dart';

///
class WindowController extends ChangeNotifier {
  WindowController._({
    required this._windowService,
  });

  final WindowService _windowService;

  /// Window settings.
  WindowSettings get settings => _windowService.settings;

  /// Start dragging the window.
  Future<void> drag() async => _windowService.drag();

  /// Closes the window.
  Future<void> close() async => _windowService.close();

  /// Minimizes the window.
  Future<void> minimize() async => _windowService.minimize();

  /// Maximizes the window or restore if its maximized.
  Future<void> maximize() async => _windowService.maxOrRestore();

  /// Fullscreens the window or restore if its fullscreened.
  Future<void> fullscreen() async => _windowService.fullOrRestore();
}
