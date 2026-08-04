part of '../window.dart';

/// Windows window controls.
class _WindowsWindowControls extends StatelessWidget {
  /// Windows window controls.
  const _WindowsWindowControls({
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
    final window = Theme.of(context).window;

    const iconSize = 16.0;
    const fgColor = Color(0x96FFFFFF);
    const bgColor = Color(0x00FFFFFF);
    const hoverFgColor = Color(0xFFFFFFFF);
    const hoverBgColor = Color(0x1AFFFFFF);

    final width = window.titleBar.height - 1.4;
    final height = window.titleBar.height;

    return _WindowControls(
      spacing: 0,
      alignment: .centerRight,
      decoration: BoxDecoration(
        color: const Color(0xFF000000),
        borderRadius: .only(bottomLeft: window.borderRadius.bottomLeft),
      ),
      children: [
        _WindowControl(
          width: width,
          height: height,
          iconSize: iconSize,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverFgColor: hoverFgColor,
          hoverBgColor: hoverBgColor,
          onPressed: onMinimizePressed,
          icon: FluentIcons.subtract_16_regular,
        ),
        _WindowControl(
          width: width,
          height: height,
          iconSize: iconSize,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverFgColor: hoverFgColor,
          hoverBgColor: hoverBgColor,
          onPressed: onMaximizePressed,
          icon: FluentIcons.maximize_16_regular,
        ),
        _WindowControl(
          width: width,
          height: height,
          iconSize: iconSize,
          fgColor: fgColor,
          bgColor: bgColor,
          hoverFgColor: hoverFgColor,
          hoverBgColor: const Color(0xFFC42B1C),
          onPressed: onClosePressed,
          icon: FluentIcons.dismiss_16_regular,
        ),
      ],
    );
  }
}
