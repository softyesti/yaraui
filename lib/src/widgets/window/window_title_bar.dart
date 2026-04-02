part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar({
    required this.service,
  });

  final WindowService service;

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
              onPanStart: (_) async => service.drag(),
              onDoubleTap: () async => service.maxOrRestore(),
              child: const SizedBox.expand(),
            ),
          ),
          switch (PlatformUtil.operatingSystem) {
            .macos => const MacOSWindowControls(),
            .linux => const LinuxWindowControls(),
            .windows => WindowsWindowControls(
              dimension: height,
              onClosePressed: () async => service.close(),
              onMaximizePressed: () async => service.maxOrRestore(),
              onMinimizePressed: () async => service.minimize(),
            ),
            OperatingSystem() => throw UnsupportedError(''),
          },
        ],
      ),
    );
  }
}
