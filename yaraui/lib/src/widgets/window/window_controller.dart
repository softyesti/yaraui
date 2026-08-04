part of 'window.dart';

/// Window controller.
class WindowController extends ChangeNotifier {
  /// Window controller.
  WindowController({required this._windowService}) {
    _state = _windowService.state;
    _stateSub = _windowService.stateStream.listen((state) {
      _state = state;
      notifyListeners();
    });
  }

  final WindowService _windowService;

  late WindowState _state;
  late final StreamSubscription<WindowState> _stateSub;

  @override
  Future<void> dispose() async {
    await Future.wait([_stateSub.cancel(), _windowService.dispose()]);
    super.dispose();
  }

  /// Returns the window state.
  WindowState get state => _state;

  /// Returns the window settings.
  WindowSettings get settings => _windowService.settings;

  /// Start dragging the window.
  Future<void> drag() async => _windowService.drag();

  /// Closes the window.
  Future<void> close() async => _windowService.close();

  /// Minimizes the window.
  Future<void> minimize() async => _windowService.minimize();

  /// Maximizes the window or restore if its maximized.
  Future<void> maxOrRestore() async => _windowService.maxOrRestore();

  /// Enter full-screen mode or exit it if you're already in that mode.
  Future<void> fullOrRestore() async => _windowService.fullOrRestore();
}
