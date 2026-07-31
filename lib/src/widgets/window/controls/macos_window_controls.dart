part of '../window.dart';

/// MacOS window controls.
class _MacOSWindowControls extends StatefulWidget {
  /// MacOS window controls.
  const _MacOSWindowControls({
    required this.onClosePressed,
    required this.onMinimizePressed,
    required this.onMaximizePressed,
  });

  /// Close button callback.
  final VoidCallback onClosePressed;

  /// Minimize button callback.
  final VoidCallback onMinimizePressed;

  /// Maximize button callback.
  final VoidCallback onMaximizePressed;

  @override
  State<StatefulWidget> createState() => _MacOSWindowControlsState();
}

class _MacOSWindowControlsState extends State<_MacOSWindowControls> {
  bool _hovered = false;
  late final WindowController _window;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _window = Window.of(context);
  }

  @override
  Widget build(BuildContext context) {
    const iconSize = 10.0;
    const dimension = 14.0;
    const borderWidth = 0.5;
    const shape = BoxShape.circle;

    return Conditional.listenable(
      listenable: _window,
      condition: () => _window._state != .fullscreen,
      child: _WindowControls(
        spacing: 8,
        alignment: .centerLeft,
        onHover: (h) => setState(() => _hovered = h),
        children: [
          _WindowControl(
            shape: shape,
            width: dimension,
            height: dimension,
            iconSize: iconSize,
            iconVisibility: _hovered,
            icon: CupertinoIcons.xmark,
            onPressed: widget.onClosePressed,
            bgColor: const Color(0xFFF26863),
            fgColor: Colors.black.withValues(alpha: 0.8),
            border: Border.all(
              width: borderWidth,
              color: const Color(0xFFD62C26),
            ),
          ),
          _WindowControl(
            shape: shape,
            width: dimension,
            height: dimension,
            iconSize: iconSize,
            iconVisibility: _hovered,
            icon: CupertinoIcons.minus,
            onPressed: widget.onMinimizePressed,
            bgColor: const Color(0xFFF4CB3B),
            fgColor: Colors.black.withValues(alpha: 0.8),
            border: Border.all(
              width: borderWidth,
              color: const Color(0xFFE7B100),
            ),
          ),
          _WindowControl(
            shape: shape,
            width: dimension,
            height: dimension,
            iconSize: iconSize,
            iconVisibility: _hovered,
            icon: CupertinoIcons.fullscreen,
            onPressed: widget.onMaximizePressed,
            bgColor: const Color(0xFF5AC544),
            fgColor: Colors.black.withValues(alpha: 0.8),
            border: Border.all(
              width: borderWidth,
              color: const Color(0xFF1EAA29),
            ),
          ),
        ],
      ),
    );
  }
}
