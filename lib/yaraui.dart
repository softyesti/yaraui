/// SoftYesTI's cross-platform Design System.
library;

import 'dart:async';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:yaraui/src/domain/window_entity.dart';
import 'package:yaraui/src/services/window/window_service.dart';

export 'domain.dart';
export 'services.dart';
export 'widgets.dart';

/// SoftYesTI's cross-platform Design System.
abstract class YaraUI {
  /// Initializes the library.
  static FutureOr<void> init({
    required Widget app,
    required WindowSettings window,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(app);

    GetIt.I.registerSingletonAsync(
      () async => WindowService.create().init(window),
      dispose: (service) async => service.dispose(),
      instanceName: 'yaraui_window_service',
    );

    log('Initialized!', name: 'yaraui');
  }
}
