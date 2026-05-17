import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:yaraui/src/domain/enums/operating_system.dart';
import 'package:yaraui/src/services/window/window_service.dart';
import 'package:yaraui/src/utils/platform_util.dart';
import 'package:yaraui/src/widgets/window/controls/linux_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/macos_window_controls.dart';
import 'package:yaraui/src/widgets/window/controls/windows_window_controls.dart';

part 'window_title_bar.dart';
part 'window_view_model.dart';

/// Application window.
class Window extends StatefulWidget {
  /// Creates a new [Window].
  const Window(
    this.child, {
    super.key,
  });

  /// The widget below this widget in the tree.
  final Widget? child;

  @override
  State<StatefulWidget> createState() => _WindowState();
}

class _WindowState extends State<Window> {
  late final _WindowViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = _WindowViewModel(
      GetIt.I.get<WindowService>(
        instanceName: 'yaraui_window_service',
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ColoredBox(
    color: const Color(0x80000000),
    child: Stack(
      fit: .expand,
      alignment: .center,
      clipBehavior: .antiAlias,
      children: [
        Positioned.fill(
          child: Container(
            padding: const .all(4),
            child: widget.child ?? const SizedBox.expand(),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: _WindowTitleBar(_viewModel),
        ),
      ],
    ),
  );
}
