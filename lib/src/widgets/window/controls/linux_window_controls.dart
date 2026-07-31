part of '../window.dart';

/// Linux window controls.
class _LinuxWindowControls extends StatelessWidget {
  /// Linux window controls.
  const _LinuxWindowControls({
    required this.onClosePressed,
    required this.onMaximizePressed,
    required this.onMinimizePressed,
  });

  /// Close button callback.
  final VoidCallback onClosePressed;

  /// Maximize button callback.
  final VoidCallback onMaximizePressed;

  /// Minimize button callback.
  final VoidCallback onMinimizePressed;

  @override
  Widget build(BuildContext context) {
    const iconSize = 12.0;
    const dimension = 24.0;
    const shape = BoxShape.circle;
    const fgColor = Color(0xFFFFFFFF);
    const bgColor = Color(0xFF242424);

    final hoverBgColor = HSLColor.fromColor(
      bgColor,
    ).withLightness(0.2).toColor();

    return _WindowControls(
      spacing: 12,
      alignment: .centerRight,
      children: [
        _WindowControl(
          shape: shape,
          width: dimension,
          height: dimension,
          iconSize: iconSize,
          onPressed: onMinimizePressed,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverBgColor: hoverBgColor,
          icon: FluentIcons.subtract_16_regular,
        ),
        _WindowControl(
          shape: shape,
          width: dimension,
          height: dimension,
          iconSize: iconSize,
          onPressed: onMaximizePressed,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverBgColor: hoverBgColor,
          icon: FluentIcons.maximize_16_regular,
        ),
        _WindowControl(
          shape: shape,
          width: dimension,
          height: dimension,
          iconSize: iconSize,
          onPressed: onClosePressed,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverBgColor: hoverBgColor,
          icon: FluentIcons.dismiss_16_regular,
        ),
      ],
    );
  }
}
