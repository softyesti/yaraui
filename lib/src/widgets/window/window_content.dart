part of 'window.dart';

class _WindowContent extends StatelessWidget {
  const _WindowContent({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final padding = theme.spacing.xs;
    final borderRadius = theme.window.borderRadius - .circular(padding);

    return Padding(
      padding: .all(padding),
      child: Container(
        clipBehavior: .antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
