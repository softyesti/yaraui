/// SoftYesTI's cross-platform Design System.
library;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'src/domain/entities/window_settings.dart';
import 'src/services/info/info_service.dart';
import 'src/services/window/window_service.dart';

export 'package:solar_icon_pack/solar_icon_pack.dart';

export 'domain.dart';
export 'widgets.dart';

/// SoftYesTI's cross-platform Design System.
sealed class YaraUI {
  const YaraUI._();

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
        InfoService.create().init,
        instanceName: 'yaraui_info_service',
        dispose: (service) async => service.dispose(),
      )
      ..registerSingletonAsync(
        WindowService.create(window).init,
        onCreated: (_) => runApp(app),
        instanceName: 'yaraui_window_service',
        dispose: (service) async => service.dispose(),
      );

    log('Initialized!', name: 'yaraui');
  }
}
