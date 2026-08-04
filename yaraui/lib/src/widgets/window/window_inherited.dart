part of 'window.dart';

class _WindowInherited extends InheritedWidget {
  const _WindowInherited({
    required super.child,
    required this.controller,
  });

  factory _WindowInherited.of(BuildContext context) {
    final i = context.dependOnInheritedWidgetOfExactType<_WindowInherited>();
    if (i == null) throw Exception('_WindowInherited not found!');
    return i;
  }

  final WindowController controller;

  @override
  bool updateShouldNotify(covariant _WindowInherited old) {
    return controller != old.controller;
  }
}
