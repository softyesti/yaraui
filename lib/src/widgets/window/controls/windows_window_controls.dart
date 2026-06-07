import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';

/// Windows window controls.
class WindowsWindowControls extends StatelessWidget {
  /// Creates a new [WindowsWindowControls].
  const WindowsWindowControls({
    required this.dimension,
    required this.onClosePressed,
    required this.onMaximizePressed,
    required this.onMinimizePressed,
    super.key,
  });

  /// Button size.
  final double dimension;

  /// Close button callback.
  final VoidCallback onClosePressed;

  /// Maximize button callback.
  final VoidCallback onMaximizePressed;

  /// Minimize button callback.
  final VoidCallback onMinimizePressed;

  @override
  Widget build(BuildContext context) => Align(
    alignment: .centerRight,
    child: Container(
      clipBehavior: .antiAlias,
      decoration: const BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: .only(bottomLeft: .circular(8)),
      ),
      child: Row(
        mainAxisSize: .min,
        children: [
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0x1AFFFFFF),
            icon: FluentIcons.subtract_16_regular,
            onPressed: onMinimizePressed,
          ),
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0x1AFFFFFF),
            icon: FluentIcons.maximize_16_regular,
            onPressed: onMaximizePressed,
          ),
          _ButtonWidget(
            dimension: dimension,
            fgColor: Colors.white,
            bgColor: const Color(0xFFC42B1C),
            icon: FluentIcons.dismiss_16_regular,
            onPressed: onClosePressed,
          ),
        ],
      ),
    ),
  );
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
    final Color fgColor;
    final Color bgColor;
    if (_hovered) {
      fgColor = widget.fgColor;
      bgColor = widget.bgColor;
    } else {
      fgColor = widget.fgColor.withValues(alpha: 0.6);
      bgColor = widget.bgColor.withAlpha(0);
    }

    return FocusableActionDetector(
      onShowHoverHighlight: (h) => setState(() => _hovered = h),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: widget.dimension * 1.4,
          height: widget.dimension,
          color: bgColor,
          alignment: .center,
          child: Icon(widget.icon, color: fgColor, size: 16),
        ),
      ),
    );
  }
}
