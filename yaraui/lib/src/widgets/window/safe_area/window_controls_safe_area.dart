part of '../window.dart';

/// Window controls safe area widget.
abstract class WindowControlsSafeArea extends StatefulWidget {
  /// Window controls safe area widget.
  factory WindowControlsSafeArea({
    required Widget child,
    Key? key,
  }) => switch (PlatformUtil.operatingSystem) {
    .macos => _MacOSWindowControlsSafeArea(key: key, child: child),
    _ => _DefaultWindowControlsSafeArea(key: key, child: child),
  };

  const WindowControlsSafeArea._({
    required this.child,
    super.key,
  });

  ///
  final Widget child;
}

abstract class _WindowControlsSafeAreaState
    extends State<WindowControlsSafeArea> {
  EdgeInsets _padding = .zero;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final window = Theme.of(context).window;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => setState(() => _padding = _getPadding(window)),
    );
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: _padding,
    child: widget.child,
  );

  EdgeInsets _getPadding(WindowTheme window);

  EdgeInsets _genInsets({
    required double windowPadding,
    required double titleBarHeight,
    required double titleBarPadding,
  }) {
    final ctx = _WindowControls._key.currentContext;
    final size = (ctx?.findRenderObject() as RenderBox?)?.size ?? Size.zero;
    final width = size.width + (titleBarPadding - windowPadding);
    return .only(top: titleBarHeight / 4, left: width, right: width);
  }
}
