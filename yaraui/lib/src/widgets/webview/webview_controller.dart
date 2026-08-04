part of 'webview.dart';

/// WebView Controller.
class WebViewController {
  /// Creates a new [WebViewController].
  WebViewController({this.product}) {
    _controller = wva.WebViewController();
    _infoService = GetIt.I.get<InfoService>(
      instanceName: 'yaraui_info_service',
    );
  }

  /// The product token (`<name>/<version>`) of the User-Agent.
  final String? product;

  late InfoService _infoService;
  late wva.WebViewController _controller;

  /// Initializes the [WebViewController].
  Future<void> _init() async => Future.wait([
    _setUserAgent(),
    _controller.setBackgroundColor(const Color(0x00000000)),
  ]);

  /// Disposes the [WebViewController].
  Future<void> dispose() async {}

  /// Goes back in the history of this WebView.
  Future<void> back() async => _controller.goBack();

  /// Goes forward in the history of this WebView.
  Future<void> forward() async => _controller.goForward();

  /// Reloads the current URL.
  Future<void> refresh() async => _controller.reload();

  /// Loads the provided URL.
  Future<void> load(Uri url) async => _controller.loadRequest(url);

  Future<void> _setUserAgent() async {
    final userAgent = await _controller.getUserAgent();
    final appProduct = '${_infoService.name}/${_infoService.version}';
    return _controller.setUserAgent('$userAgent ${product ?? appProduct}');
  }
}
