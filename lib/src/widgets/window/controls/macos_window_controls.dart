import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:yaraui/src/mixins/theme_mixin.dart';

/// macOS window controls.
class MacOSWindowControls extends StatefulWidget {
  /// Creates a new [MacOSWindowControls].
  const MacOSWindowControls({
    required this.onClosePressed,
    required this.onMaximizePressed,
    required this.onMinimizePressed,
    super.key,
  });

  /// Close button callback.
  final VoidCallback onClosePressed;

  /// Maximize button callback.
  final VoidCallback onMaximizePressed;

  /// Minimize button callback.
  final VoidCallback onMinimizePressed;

  @override
  State<StatefulWidget> createState() => _MacOSWindowControlsState();
}

class _MacOSWindowControlsState extends State<MacOSWindowControls>
    with ThemeMixin {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final metrics = getThemeMetrics(context);

    return Container(
      alignment: .centerLeft,
      padding: metrics.titleBar.padding,
      child: FocusableActionDetector(
        onShowHoverHighlight: (h) => setState(() => _hovered = h),
        child: Row(
          mainAxisSize: .min,
          spacing: metrics.spacing.sm,
          children: [
            _ButtonWidget(
              hovered: _hovered,
              icon: CupertinoIcons.xmark,
              onPressed: widget.onClosePressed,
              bgColor: const Color(0xFFF26863),
              borderColor: const Color(0xFFD62C26),
              fgColor: Colors.black.withValues(alpha: 0.8),
            ),
            _ButtonWidget(
              hovered: _hovered,
              icon: CupertinoIcons.minus,
              onPressed: widget.onMinimizePressed,
              bgColor: const Color(0xFFF4CB3B),
              borderColor: const Color(0xFFE7B100),
              fgColor: Colors.black.withValues(alpha: 0.8),
            ),
            _ButtonWidget(
              hovered: _hovered,
              icon: CupertinoIcons.fullscreen,
              onPressed: widget.onMaximizePressed,
              bgColor: const Color(0xFF5AC544),
              borderColor: const Color(0xFF1EAA29),
              fgColor: Colors.black.withValues(alpha: 0.8),
            ),
          ],
        ),
      ),
    );
  }
}

class _ButtonWidget extends StatelessWidget {
  const _ButtonWidget({
    required this.icon,
    required this.hovered,
    required this.onPressed,
    required this.fgColor,
    required this.bgColor,
    required this.borderColor,
  });

  final IconData icon;
  final bool hovered;
  final VoidCallback onPressed;
  final Color fgColor;
  final Color bgColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressed,
    child: Container(
      width: 14,
      height: 14,
      alignment: .center,
      decoration: BoxDecoration(
        color: bgColor,
        shape: .circle,
        border: .all(
          color: borderColor,
          width: .5,
        ),
      ),
      child: Visibility(
        visible: hovered,
        child: Icon(
          icon,
          size: 10,
          color: fgColor,
        ),
      ),
    ),
  );
}
