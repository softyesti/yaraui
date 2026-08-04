import 'dart:io' as io;

import 'package:flutter/widgets.dart';
import 'package:yaraui/src/domain/enums/operating_system.dart';

/// Information about the environment in which the current program is running.
abstract class PlatformUtil {
  /// The version of the current Dart runtime.
  static String get version => io.Platform.version;

  /// The local hostname for the system.
  static String get hostname => io.Platform.localHostname;

  /// The absolute URI of the script being run in this isolate.
  static Uri get script => io.Platform.script;

  /// The path of the executable used to run the script in this isolate.
  /// Usually dart when running on the Dart VM or the compiled
  /// script name (script_name.exe).
  static String get executable => io.Platform.executable;

  /// The path of the executable used to run the script in this isolate after
  /// it has been resolved by the OS.
  static String get resolvedExecutable => io.Platform.resolvedExecutable;

  /// The --packages flag passed to the executable used to run the script
  /// in this isolate.
  static String? get package => io.Platform.packageConfig;

  /// The flags passed to the executable used to run the script in
  /// this isolate.
  static List<String> get arguments => io.Platform.executableArguments;

  /// The path separator used by the operating system to separate components
  /// in file paths.
  static String get separator => io.Platform.pathSeparator;

  /// The current operating system's default line terminator.
  static String get terminator => io.Platform.lineTerminator;

  /// The number of individual execution units of the machine.
  static int get processors => io.Platform.numberOfProcessors;

  /// Get the current locale.
  static Locale get locale {
    final split = io.Platform.localeName.split('_');
    return Locale(split.first, split.lastOrNull);
  }

  /// Gets the current operating system or platform.
  static OperatingSystem get operatingSystem =>
      .parse(io.Platform.operatingSystem);

  /// A string representing the version of the operating system or platform.
  static String get operatingSystemVersion =>
      io.Platform.operatingSystemVersion;

  /// The environment for this process as a map from string key to
  /// string value.
  static Map<String, String> get environment => io.Platform.environment;
}
