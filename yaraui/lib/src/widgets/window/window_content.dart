part of 'window.dart';

class _WindowContent extends StatelessWidget {
  const _WindowContent({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final padding = theme.window.padding;
    final borderRadius = theme.window.borderRadius - .circular(padding.top);

    return Padding(
      padding: padding,
      child: ClipRSuperellipse(
        borderRadius: borderRadius,
        child: child,
      ),
    );
  }
}
