part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar(this._viewModel);

  final _WindowViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: theme.window.titleBar.height,
      child: Stack(
        fit: .expand,
        alignment: .center,
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: .translucent,
              onPanStart: (_) async => _viewModel.drag(),
              onDoubleTap: () async => _viewModel.maximize(),
              child: const SizedBox.expand(),
            ),
          ),
          Positioned.fill(
            child: switch (PlatformUtil.operatingSystem) {
              .macos => MacOSWindowControls(
                onClosePressed: () async => _viewModel.close(),
                onMaximizePressed: () async => _viewModel.fullscreen(),
                onMinimizePressed: () async => _viewModel.minimize(),
              ),
              .linux => const LinuxWindowControls(),
              .windows => WindowsWindowControls(
                onClosePressed: () async => _viewModel.close(),
                onMaximizePressed: () async => _viewModel.maximize(),
                onMinimizePressed: () async => _viewModel.minimize(),
              ),
              OperatingSystem() => throw UnsupportedError(
                'Unsupported platform: ${PlatformUtil.operatingSystem}',
              ),
            },
          ),
        ],
      ),
    );
  }
}
