part of 'window.dart';

class _WindowContent extends StatelessWidget {
  const _WindowContent({required this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: .all(theme.spacing.xs),
      child: child,
    );
  }
}
