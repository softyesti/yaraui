import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yaraui/src/domain/enums/operating_system.dart';
import 'package:yaraui/src/services/window/window_service.dart';
import 'package:yaraui/src/utils/platform_util.dart';
import 'package:yaraui/src/widgets/window/controls/linux_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/macos_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/windows_window_controls.dart';

part 'window_title_bar.dart';

/// Application window.
class WindowWidget extends StatefulWidget {
  /// Creates a new [WindowWidget].
  const WindowWidget(this.child, {super.key});

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _WindowWidgetState();
}

class _WindowWidgetState extends State<WindowWidget> {
  late final WindowService _service;

  @override
  void initState() {
    super.initState();
    _service = GetIt.I.get<WindowService>(
      instanceName: 'yaraui_window_service',
    );
  }

  @override
  Widget build(BuildContext context) => Stack(
    fit: .expand,
    alignment: .center,
    clipBehavior: .antiAlias,
    children: [
      Positioned.fill(child: SizedBox.expand(child: widget.child)),
      Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: _WindowTitleBar(service: _service),
      ),
    ],
  );
}
