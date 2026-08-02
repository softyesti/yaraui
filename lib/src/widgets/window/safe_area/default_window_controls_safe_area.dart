part of '../window.dart';

class _DefaultWindowControlsSafeArea extends WindowControlsSafeArea {
  const _DefaultWindowControlsSafeArea({
    required super.child,
    super.key,
  }) : super._();

  @override
  State<StatefulWidget> createState() => _DefaultWindowControlsSafeAreaState();
}

class _DefaultWindowControlsSafeAreaState extends _WindowControlsSafeAreaState {
  @override
  EdgeInsets _getPadding(WindowTheme window) => _genInsets(
    windowPadding: window.padding.right,
    titleBarHeight: window.titleBar.height,
    titleBarPadding: window.titleBar.padding.right,
  ).copyWith(left: 0);
}
