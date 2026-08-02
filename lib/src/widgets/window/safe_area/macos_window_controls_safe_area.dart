part of '../window.dart';

/// Window controls safe area widget.
class _MacOSWindowControlsSafeArea extends WindowControlsSafeArea {
  /// Window controls safe area widget.
  const _MacOSWindowControlsSafeArea({
    required super.child,
    super.key,
  }) : super._();

  @override
  State<StatefulWidget> createState() => _MacOSWindowControlsSafeAreaSate();
}

class _MacOSWindowControlsSafeAreaSate extends _WindowControlsSafeAreaState {
  @override
  EdgeInsets _getPadding(WindowTheme window) => _genInsets(
    windowPadding: window.padding.left,
    titleBarHeight: window.titleBar.height,
    titleBarPadding: window.titleBar.padding.left,
  ).copyWith(right: 0);
}
