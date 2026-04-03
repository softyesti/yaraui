part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar(this._viewModel);

  final _WindowViewModel _viewModel;

  @override
  Widget build(BuildContext context) {
    final height = switch (PlatformUtil.operatingSystem) {
      .linux => 32.0,
      .macos => 32.0,
      .windows => 32.0,
      OperatingSystem() => throw UnsupportedError(''),
    };

    return SizedBox(
      height: height,
      child: Row(
        mainAxisAlignment: .center,
        children: [
          Expanded(
            child: GestureDetector(
              behavior: .translucent,
              onPanStart: (_) async => _viewModel.drag(),
              onDoubleTap: () async => _viewModel.maximize(),
              child: const SizedBox.expand(),
            ),
          ),
          switch (PlatformUtil.operatingSystem) {
            .macos => const MacOSWindowControls(),
            .linux => const LinuxWindowControls(),
            .windows => WindowsWindowControls(
              dimension: height,
              onClosePressed: () async => _viewModel.close(),
              onMaximizePressed: () async => _viewModel.maximize(),
              onMinimizePressed: () async => _viewModel.minimize(),
            ),
            OperatingSystem() => throw UnsupportedError(''),
          },
        ],
      ),
    );
  }
}
