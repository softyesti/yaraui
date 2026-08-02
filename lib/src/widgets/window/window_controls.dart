part of 'window.dart';

class _WindowControls extends StatelessWidget {
  const _WindowControls({
    required this.spacing,
    required this.alignment,
    required this.children,
    this.decoration,
    this.onHover,
  });

  final double spacing;
  final Alignment alignment;
  final List<_WindowControl> children;
  final BoxDecoration? decoration;
  final ValueChanged<bool>? onHover;

  static final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: FocusableActionDetector(
        onShowHoverHighlight: onHover,
        child: Container(
          decoration: decoration,
          key: _WindowControls._key,
          clipBehavior: decoration == null ? .none : .antiAlias,
          child: Row(
            mainAxisSize: .min,
            spacing: spacing,
            children: children,
          ),
        ),
      ),
    );
  }
}

class _WindowControl extends StatefulWidget {
  const _WindowControl({
    required this.width,
    required this.height,
    required this.icon,
    required this.iconSize,
    required this.fgColor,
    required this.bgColor,
    required this.onPressed,
    this.shape = .rectangle,
    this.iconVisibility = true,
    this.border,
    this.hoverFgColor,
    this.hoverBgColor,
  });

  final double width;
  final double height;
  final IconData icon;
  final double iconSize;
  final Color fgColor;
  final Color bgColor;
  final VoidCallback onPressed;
  final BoxShape shape;
  final bool iconVisibility;
  final Border? border;
  final Color? hoverFgColor;
  final Color? hoverBgColor;

  @override
  State<StatefulWidget> createState() => _WindowControlState();
}

class _WindowControlState extends State<_WindowControl> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    late final Color fgColor;
    late final Color bgColor;
    if (_hovered) {
      fgColor = widget.hoverFgColor ?? widget.fgColor;
      bgColor = widget.hoverBgColor ?? widget.bgColor;
    } else {
      fgColor = widget.fgColor;
      bgColor = widget.bgColor;
    }

    return FocusableActionDetector(
      onShowHoverHighlight: (h) => setState(() => _hovered = h),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: .center,
          clipBehavior: .antiAlias,
          decoration: BoxDecoration(
            color: bgColor,
            shape: widget.shape,
            border: widget.border,
          ),
          child: Visibility(
            visible: widget.iconVisibility,
            child: Icon(
              widget.icon,
              color: fgColor,
              size: widget.iconSize,
            ),
          ),
        ),
      ),
    );
  }
}
