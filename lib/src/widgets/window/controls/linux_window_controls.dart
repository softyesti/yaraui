import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:yaraui/src/theme/theme.dart';

/// Linux window controls.
class LinuxWindowControls extends StatelessWidget {
  /// Creates a new [LinuxWindowControls].
  const LinuxWindowControls({
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dimension = theme.window.titleBar.height;

    return Container(
      alignment: .centerRight,
      padding: theme.window.titleBar.padding,
      child: Row(
        spacing: 12,
        mainAxisSize: .min,
        children: [
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0xFF242424),
            icon: FluentIcons.subtract_16_regular,
            onPressed: onMinimizePressed,
          ),
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0xFF242424),
            icon: FluentIcons.maximize_16_regular,
            onPressed: onMaximizePressed,
          ),
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0xFF242424),
            icon: FluentIcons.dismiss_16_regular,
            onPressed: onClosePressed,
          ),
        ],
      ),
    );
  }
}

class _ButtonWidget extends StatefulWidget {
  const _ButtonWidget({
    required this.icon,
    required this.fgColor,
    required this.bgColor,
    required this.dimension,
    required this.onPressed,
  });

  final IconData icon;
  final Color fgColor;
  final Color bgColor;
  final double dimension;
  final VoidCallback onPressed;

  @override
  State<StatefulWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<_ButtonWidget> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final Color bgColor;
    if (_hovered) {
      bgColor = HSLColor.fromColor(
        widget.bgColor,
      ).withLightness(0.2).toColor();
    } else {
      bgColor = widget.bgColor;
    }

    return FocusableActionDetector(
      onShowHoverHighlight: (h) => setState(() => _hovered = h),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: 24,
          height: 24,
          alignment: .center,
          decoration: BoxDecoration(
            color: bgColor,
            shape: .circle,
          ),
          child: Icon(widget.icon, color: widget.fgColor, size: 12),
        ),
      ),
    );
  }
}
