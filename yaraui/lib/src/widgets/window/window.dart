import 'dart:async';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import '../../domain/entities/theme/theme_data.dart';
import '../../domain/entities/window_settings.dart';
import '../../domain/enums/window_state.dart';
import '../../services/window/window_service.dart';
import '../../theme/theme.dart';
import '../../utils/platform_util.dart';
import '../conditional.dart';

part 'window_content.dart';
part 'window_controls.dart';
part 'window_title_bar.dart';
part 'window_inherited.dart';
part 'window_controller.dart';
part 'controls/linux_window_controls.dart';
part 'controls/macos_window_controls.dart';
part 'controls/windows_window_controls.dart';
part 'safe_area/window_controls_safe_area.dart';
part 'safe_area/macos_window_controls_safe_area.dart';
part 'safe_area/default_window_controls_safe_area.dart';

/// Application window.
class Window extends StatefulWidget {
  /// Creates a new [Window].
  const Window(this.child, {super.key});

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _WindowState();

  /// Gets the window controller.
  static WindowController of(
    BuildContext context,
  ) => _WindowInherited.of(context).controller;
}

class _WindowState extends State<Window> {
  late final WindowController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WindowController(
      windowService: GetIt.I.get<WindowService>(
        instanceName: 'yaraui_window_service',
      ),
    );
  }

  @override
  void dispose() {
    unawaited(_controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return _WindowInherited(
      controller: _controller,
      child: Container(
        clipBehavior: .antiAlias,
        decoration: ShapeDecoration(
          color: const Color(0x80000000),
          shape: RoundedSuperellipseBorder(
            borderRadius: theme.window.borderRadius,
          ),
        ),
        child: Stack(
          fit: .expand,
          alignment: .center,
          clipBehavior: .antiAlias,
          children: [
            Positioned.fill(child: _WindowContent(child: widget.child)),
            const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: _WindowTitleBar(),
            ),
          ],
        ),
      ),
    );
  }
}
