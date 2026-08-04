import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:webview_all/webview_all.dart' as wva;
import 'package:yaraui/src/services/info/info_service.dart';

part 'webview_controller.dart';

/// WebView widget.
class WebView extends StatefulWidget {
  /// Creates a new [WebView].
  const WebView({
    required this.controller,
    super.key,
  });

  /// WebView controller.
  final WebViewController controller;

  @override
  State<StatefulWidget> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  @override
  void initState() {
    super.initState();
    unawaited(widget.controller._init());
  }

  @override
  void dispose() {
    unawaited(widget.controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => wva.WebViewWidget(
    controller: widget.controller._controller,
  );
}
