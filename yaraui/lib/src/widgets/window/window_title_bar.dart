part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar();

  @override
  Widget build(BuildContext context) {
    final controller = Window.of(context);
    final titleBar = Theme.of(context).window.titleBar;

    return SizedBox(
      height: titleBar.height,
      child: Stack(
        fit: .expand,
        alignment: .center,
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: .translucent,
              onPanStart: (_) async => controller.drag(),
              onDoubleTap: () async => controller.maxOrRestore(),
              child: const SizedBox.expand(),
            ),
          ),
          Padding(
            padding: titleBar.padding,
            child: switch (PlatformUtil.operatingSystem) {
              .macos => _MacOSWindowControls(
                onClosePressed: () async => controller.close(),
                onMinimizePressed: () async => controller.minimize(),
                onMaximizePressed: () async => controller.fullOrRestore(),
              ),
              .linux => _LinuxWindowControls(
                onClosePressed: () async => controller.close(),
                onMaximizePressed: () async => controller.maxOrRestore(),
                onMinimizePressed: () async => controller.minimize(),
              ),
              .windows => _WindowsWindowControls(
                onClosePressed: () async => controller.close(),
                onMaximizePressed: () async => controller.maxOrRestore(),
                onMinimizePressed: () async => controller.minimize(),
              ),
              _ => throw UnsupportedError(
                'Unsupported platform: ${PlatformUtil.operatingSystem}',
              ),
            },
          ),
        ],
      ),
    );
  }
}
