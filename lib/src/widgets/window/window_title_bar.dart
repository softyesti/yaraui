part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar(this._viewModel);

  final _WindowViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final height = switch (PlatformUtil.operatingSystem) {
      .linux => 32.0,
      .macos => 54.0,
      .windows => 32.0,
      OperatingSystem() => throw UnsupportedError(''),
    };

    return SizedBox(
      height: height,
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
                dimension: height,
                onClosePressed: () async => _viewModel.close(),
                onMaximizePressed: () async => _viewModel.maximize(),
                onMinimizePressed: () async => _viewModel.minimize(),
              ),
              OperatingSystem() => throw UnsupportedError(''),
            },
          ),
        ],
      ),
    );
  }
}
