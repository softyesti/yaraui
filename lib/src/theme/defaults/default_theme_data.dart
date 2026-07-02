import 'package:yaraui/src/domain/entities/theme/theme_data.dart';
import 'package:yaraui/src/utils/platform_util.dart';

part 'linux_theme_data.dart';
part 'macos_theme_data.dart';
part 'windows_theme_data.dart';

/// Represents default theme.
class DefaultThemeData extends ThemeData {
  /// Creates a new [DefaultThemeData].
  const DefaultThemeData({
    required super.titleBar,
    super.spacing = const .new(
      xs: 4,
      sm: 8,
      md: 16,
      lg: 24,
      xl: 32,
    ),
  });

  /// Creates a new [DefaultThemeData] with default implementation.
  factory DefaultThemeData.create() => switch (PlatformUtil.operatingSystem) {
    .macos => const MacOSThemeData(),
    .linux => const LinuxThemeData(),
    .windows => const WindowsThemeData(),
    _ => throw UnsupportedError(
      'Unsupported platform: ${PlatformUtil.operatingSystem}',
    ),
  };
}
