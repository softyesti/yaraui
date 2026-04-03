part of 'window.dart';

class _WindowViewModel extends ChangeNotifier {
  _WindowViewModel(this._service);

  final WindowService _service;

  Future<void> drag() async => _service.drag();
  Future<void> close() async => _service.close();
  Future<void> maximize() async => _service.maxOrRestore();
  Future<void> minimize() async => _service.minimize();
}
