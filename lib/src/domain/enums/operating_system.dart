/// Enum that represents operating systems.
enum OperatingSystem {
  /// iOS.
  ios,

  /// macOS.
  macos,

  /// Linux.
  linux,

  /// Windows.
  windows,

  /// Android.
  android,

  /// Fuchsia.
  fuchsia,

  /// Other.
  other
  ;

  const OperatingSystem();

  /// Parse operating system from string.
  static OperatingSystem parse(String value) => switch (value) {
    'ios' => .ios,
    'macos' => .macos,
    'linux' => .linux,
    'windows' => .windows,
    'android' => .android,
    'fuchsia' => .fuchsia,
    String() => .other,
  };
}
