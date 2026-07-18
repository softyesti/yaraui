/// SoftYesTI's cross-platform Design System.
library;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:yaraui/src/domain/entities/window_settings.dart';
import 'package:yaraui/src/services/info/info_service.dart';
import 'package:yaraui/src/services/window/window_service.dart';

export 'domain.dart';
export 'services.dart';
export 'widgets.dart';

/// SoftYesTI's cross-platform Design System.
sealed class YaraUI {
  const YaraUI();

  /// Initializes the library.
  ///
  /// Make sure you've initialized the bindings by placing
  /// `WidgetsFlutterBinding.ensureInitialized();` at the beginning
  /// of the main method.
  static Future<void> init({
    required Widget app,
    required WindowSettings window,
  }) async {
    GetIt.I
      ..registerSingletonAsync(
        () async => InfoService.create().init(),
        dispose: (service) async => service.dispose(),
        instanceName: 'yaraui_info_service',
      )
      ..registerSingletonAsync(
        () async => const WindowService.create().init(window),
        dispose: (service) async => service.dispose(),
        instanceName: 'yaraui_window_service',
        onCreated: (_) => runApp(app),
      );

    log('Initialized!', name: 'yaraui');
  }
}
