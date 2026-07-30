import 'package:flutter/widgets.dart';

/// Conditional widget rendering.
class Conditional extends StatelessWidget {
  /// Conditional widget rendering.
  Conditional({
    required this.child,
    this.condition = true,
    this.replacement = const SizedBox.shrink(),
    super.key,
  }) {
    _condition = null;
    _listenable = null;
  }

  /// Conditional widget rendering. Wrap the widget in a [ListenableBuilder].
  Conditional.listenable({
    required this._listenable,
    required this._condition,
    required this.child,
    this.replacement = const SizedBox.shrink(),
    super.key,
  }) {
    condition = false;
  }

  /// The widget to show or hide, as controlled by [condition].
  final Widget child;

  /// Switches between showing the [child] or hiding it.
  late final bool condition;

  /// The widget to use when the child is not visible,
  /// as controlled by [condition].
  final Widget replacement;

  /// The [Listenable] to which this widget is listening.
  late final Listenable? _listenable;

  //
  // ignore: comment_references
  /// Called every time the [listenable] notifies about a change.
  late final bool Function()? _condition;

  @override
  Widget build(BuildContext context) => switch (_listenable) {
    null => switch (condition) {
      true => child,
      false => replacement,
    },
    final l => ListenableBuilder(
      listenable: l,
      builder: (_, _) => switch (_condition!()) {
        true => child,
        false => replacement,
      },
    ),
  };
}
