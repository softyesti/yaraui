import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:yaraui/src/domain/entities/window_settings.dart';
import 'package:yaraui/src/services/window/window_service.dart';
import 'package:yaraui/src/theme/theme.dart';
import 'package:yaraui/src/utils/platform_util.dart';
import 'package:yaraui/src/widgets/window/controls/linux_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/macos_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/windows_window_controls.dart';

part 'window_content.dart';
part 'window_title_bar.dart';
part 'window_inherited.dart';
part 'window_controller.dart';

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
    _controller = WindowController._(
      windowService: GetIt.I.get<WindowService>(
        instanceName: 'yaraui_window_service',
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
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
          shape: RoundedRectangleBorder(
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
