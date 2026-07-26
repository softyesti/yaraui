part of 'window.dart';

class _WindowTitleBar extends StatelessWidget {
  const _WindowTitleBar();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Window.of(context);

    return SizedBox(
      height: theme.window.titleBar.height,
      child: Stack(
        fit: .expand,
        alignment: .center,
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: .translucent,
              onPanStart: (_) async => controller.drag(),
              onDoubleTap: () async => controller.maximize(),
              child: const SizedBox.expand(),
            ),
          ),
          Positioned.fill(
            child: switch (PlatformUtil.operatingSystem) {
              .macos => MacOSWindowControls(
                onClosePressed: () async => controller.close(),
                onMaximizePressed: () async => controller.fullOrRestore(),
                onMinimizePressed: () async => controller.minimize(),
              ),
              .linux => LinuxWindowControls(
                onClosePressed: () async => controller.close(),
                onMaximizePressed: () async => controller.maximize(),
                onMinimizePressed: () async => controller.minimize(),
              ),
              .windows => WindowsWindowControls(
                onClosePressed: () async => controller.close(),
                onMaximizePressed: () async => controller.maximize(),
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
