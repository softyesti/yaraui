import 'package:flutter/widgets.dart';
import 'package:yaraui/src/theme/theme.dart';
import 'package:yaraui/src/utils/platform_util.dart';
import 'package:yaraui/src/widgets/window/window.dart';

part 'main_app.dart';

/// An application that uses Yara Design.
class YaraApp extends StatelessWidget {
  /// Creates a new [YaraApp].
  factory YaraApp({
    String? title,
    Map<Type, Action<Intent>>? actions,
    Widget Function(BuildContext, Widget?)? builder,
    bool debugShowCheckedModeBanner = true,
    bool debugShowWidgetInspector = false,
    Widget Function(
      BuildContext, {
      required GlobalKey<State<StatefulWidget>> key,
      required void Function() onPressed,
      required String semanticsLabel,
    })?
    exitWidgetSelectionButtonBuilder,
    Widget? home,
    String? initialRoute,
    Key? key,
    Locale? locale,
    Locale? Function(List<Locale>?, Iterable<Locale>)?
    localeListResolutionCallback,
    Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required String semanticsLabel,
      bool usesDefaultAlignment,
    })?
    moveExitWidgetSelectionButtonBuilder,
    List<NavigatorObserver> navigatorObservers = const <NavigatorObserver>[],
    GlobalKey<NavigatorState>? navigatorKey,
    List<Route<dynamic>> Function(String)? onGenerateInitialRoutes,
    Route<dynamic>? Function(RouteSettings)? onGenerateRoute,
    String Function(BuildContext)? onGenerateTitle,
    bool Function(NavigationNotification)? onNavigationNotification,
    Route<dynamic>? Function(RouteSettings)? onUnknownRoute,
    PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))?
    pageRouteBuilder,
    String? restorationScopeId,
    Map<String, Widget Function(BuildContext)> routes =
        const <String, WidgetBuilder>{},
    bool showSemanticsDebugger = false,
    bool showPerformanceOverlay = false,
    Map<ShortcutActivator, Intent>? shortcuts,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required bool selectionOnTapEnabled,
      required String semanticsLabel,
    })?
    tapBehaviorButtonBuilder,
    TextStyle? textStyle,
  }) => YaraApp._(
    title: title,
    actions: actions,
    builder: builder,
    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    debugShowWidgetInspector: debugShowWidgetInspector,
    exitWidgetSelectionButtonBuilder: exitWidgetSelectionButtonBuilder,
    home: home,
    initialRoute: initialRoute,
    key: key,
    locale: locale,
    localeListResolutionCallback: localeListResolutionCallback,
    localeResolutionCallback: localeResolutionCallback,
    localizationsDelegates: localizationsDelegates,
    moveExitWidgetSelectionButtonBuilder: moveExitWidgetSelectionButtonBuilder,
    navigatorObservers: navigatorObservers,
    navigatorKey: navigatorKey,
    onGenerateInitialRoutes: onGenerateInitialRoutes,
    onGenerateRoute: onGenerateRoute,
    onGenerateTitle: onGenerateTitle,
    onNavigationNotification: onNavigationNotification,
    onUnknownRoute: onUnknownRoute,
    pageRouteBuilder: pageRouteBuilder,
    restorationScopeId: restorationScopeId,
    routes: routes,
    showSemanticsDebugger: showSemanticsDebugger,
    showPerformanceOverlay: showPerformanceOverlay,
    shortcuts: shortcuts,
    supportedLocales: supportedLocales,
    tapBehaviorButtonBuilder: tapBehaviorButtonBuilder,
    textStyle: textStyle,
  );

  /// Creates a new [YaraApp] that uses the [Router] instead of a [Navigator].
  factory YaraApp.router({
    String? title,
    Map<Type, Action<Intent>>? actions,
    BackButtonDispatcher? backButtonDispatcher,
    Widget Function(BuildContext, Widget?)? builder,
    bool debugShowCheckedModeBanner = true,
    bool debugShowWidgetInspector = false,
    Widget Function(
      BuildContext, {
      required GlobalKey<State<StatefulWidget>> key,
      required void Function() onPressed,
      required String semanticsLabel,
    })?
    exitWidgetSelectionButtonBuilder,
    Key? key,
    Locale? locale,
    Locale? Function(List<Locale>?, Iterable<Locale>)?
    localeListResolutionCallback,
    Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback,
    Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates,
    Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required String semanticsLabel,
      bool usesDefaultAlignment,
    })?
    moveExitWidgetSelectionButtonBuilder,
    String Function(BuildContext)? onGenerateTitle,
    bool Function(NavigationNotification)? onNavigationNotification,
    String? restorationScopeId,
    RouteInformationParser<Object>? routeInformationParser,
    RouteInformationProvider? routeInformationProvider,
    RouterConfig<Object>? routerConfig,
    RouterDelegate<Object>? routerDelegate,
    bool showSemanticsDebugger = false,
    bool showPerformanceOverlay = false,
    Map<ShortcutActivator, Intent>? shortcuts,
    Iterable<Locale> supportedLocales = const <Locale>[Locale('en', 'US')],
    Widget Function(
      BuildContext, {
      required void Function() onPressed,
      required bool selectionOnTapEnabled,
      required String semanticsLabel,
    })?
    tapBehaviorButtonBuilder,
    TextStyle? textStyle,
  }) => YaraApp._(
    title: title,
    actions: actions,
    backButtonDispatcher: backButtonDispatcher,
    builder: builder,
    debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    debugShowWidgetInspector: debugShowWidgetInspector,
    exitWidgetSelectionButtonBuilder: exitWidgetSelectionButtonBuilder,
    key: key,
    locale: locale,
    localeListResolutionCallback: localeListResolutionCallback,
    localeResolutionCallback: localeResolutionCallback,
    localizationsDelegates: localizationsDelegates,
    moveExitWidgetSelectionButtonBuilder: moveExitWidgetSelectionButtonBuilder,
    onGenerateTitle: onGenerateTitle,
    onNavigationNotification: onNavigationNotification,
    restorationScopeId: restorationScopeId,
    routeInformationParser: routeInformationParser,
    routeInformationProvider: routeInformationProvider,
    routerConfig: routerConfig,
    routerDelegate: routerDelegate,
    showSemanticsDebugger: showSemanticsDebugger,
    showPerformanceOverlay: showPerformanceOverlay,
    shortcuts: shortcuts,
    supportedLocales: supportedLocales,
    tapBehaviorButtonBuilder: tapBehaviorButtonBuilder,
    textStyle: textStyle,
  );

  const YaraApp._({
    this.title,
    this.actions,
    this.backButtonDispatcher,
    this.builder,
    this.debugShowCheckedModeBanner = true,
    this.debugShowWidgetInspector = false,
    this.exitWidgetSelectionButtonBuilder,
    this.home,
    this.initialRoute,
    super.key,
    this.locale,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.localizationsDelegates,
    this.moveExitWidgetSelectionButtonBuilder,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.navigatorKey,
    this.onGenerateInitialRoutes,
    this.onGenerateRoute,
    this.onGenerateTitle,
    this.onNavigationNotification,
    this.onUnknownRoute,
    this.pageRouteBuilder,
    this.restorationScopeId,
    this.routeInformationParser,
    this.routeInformationProvider,
    this.routes = const <String, WidgetBuilder>{},
    this.routerConfig,
    this.routerDelegate,
    this.showSemanticsDebugger = false,
    this.showPerformanceOverlay = false,
    this.shortcuts,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.tapBehaviorButtonBuilder,
    this.textStyle,
  });

  /// A one-line description used by the device to identify the app for
  /// the user.
  final String? title;

  /// The default map of intent keys to actions for the application.
  final Map<Type, Action<Intent>>? actions;

  /// A delegate that decide whether to handle the Android back button intent.
  final BackButtonDispatcher? backButtonDispatcher;

  /// A builder for inserting widgets above the [Navigator] or - when the
  /// [WidgetsApp.router] constructor is used - above the [Router] but below
  /// the other widgets created by the [WidgetsApp] widget, or for replacing
  /// the [Navigator]/[Router] entirely.
  final Widget Function(BuildContext, Widget?)? builder;

  /// Turns on a little "DEBUG" banner in debug mode to indicate that the app
  /// is in debug mode. This is on by default (in debug mode), to turn it off,
  /// set the constructor argument to false. In release mode this has no effect.
  final bool debugShowCheckedModeBanner;

  /// Turns on an overlay that enables inspecting the widget tree.
  final bool debugShowWidgetInspector;

  /// Builds the widget the [WidgetInspector] uses to exit selection mode.
  final Widget Function(
    BuildContext, {
    required GlobalKey<State<StatefulWidget>> key,
    required void Function() onPressed,
    required String semanticsLabel,
  })?
  exitWidgetSelectionButtonBuilder;

  /// The widget for the default route of the app
  /// ([Navigator.defaultRouteName], which is /).
  final Widget? home;

  /// The name of the first route to show, if a [Navigator] is built.
  final String? initialRoute;

  /// The initial locale for this app's [Localizations] widget is based on
  /// this value.
  final Locale? locale;

  /// This callback is responsible for choosing the app's locale when the app
  /// is started, and when the user changes the device's locale.
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
  localeListResolutionCallback;

  /// This callback is responsible for choosing the app's locale when the app
  /// is started, and when the user changes the device's locale.
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;

  /// The delegates for this app's [Localizations] widget.
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// Builds the widget the [WidgetInspector] uses to move the exit selection
  /// mode button.
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required String semanticsLabel,
    bool usesDefaultAlignment,
  })?
  moveExitWidgetSelectionButtonBuilder;

  /// The list of observers for the [Navigator] created for this app.
  final List<NavigatorObserver> navigatorObservers;

  /// A key to use when building the [Navigator].
  final GlobalKey<NavigatorState>? navigatorKey;

  /// The routes generator callback used for generating initial routes if
  /// [initialRoute] is provided.
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;

  /// The route generator callback used when the app is navigated to a
  /// named route.
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  /// If non-null this callback function is called to produce the
  /// app's title string, otherwise [title] is used.
  final String Function(BuildContext)? onGenerateTitle;

  /// The callback to use when receiving a [NavigationNotification].
  final bool Function(NavigationNotification)? onNavigationNotification;

  /// Called when [onGenerateRoute] fails to generate a route, except for
  /// the [initialRoute].
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;

  /// The [PageRoute] generator callback used when the app is navigated to a
  /// named route.
  final PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))?
  pageRouteBuilder;

  /// The identifier to use for state restoration of this app.
  final String? restorationScopeId;

  /// A delegate to parse the route information from the
  /// [routeInformationProvider] into a generic data type to be processed by
  /// the [routerDelegate] at a later stage.
  final RouteInformationParser<Object>? routeInformationParser;

  /// A object that provides route information through the
  /// [RouteInformationProvider.value] and notifies its listener when its
  /// value changes.
  final RouteInformationProvider? routeInformationProvider;

  /// The application's top-level routing table.
  final Map<String, Widget Function(BuildContext)> routes;

  /// An object to configure the underlying [Router].
  final RouterConfig<Object>? routerConfig;

  /// A delegate that configures a widget, typically a [Navigator], with
  /// parsed result from the [routeInformationParser].
  final RouterDelegate<Object>? routerDelegate;

  /// Turns on an overlay that shows the accessibility information reported
  /// by the framework.
  final bool showSemanticsDebugger;

  /// Turns on a performance overlay.
  final bool showPerformanceOverlay;

  /// The default map of keyboard shortcuts to intents for the application.
  final Map<ShortcutActivator, Intent>? shortcuts;

  /// The list of locales that this app has been localized for.
  final Iterable<Locale> supportedLocales;

  /// Builds the widget the [WidgetInspector] uses to change the default
  /// behavior when tapping on widgets in the app.
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required bool selectionOnTapEnabled,
    required String semanticsLabel,
  })?
  tapBehaviorButtonBuilder;

  /// The default text style for [Text] in the application.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) => Theme(
    data: DefaultThemeData(),
    child: _MainApp(
      color: const Color(0x00000000),
      title: title,
      actions: actions,
      backButtonDispatcher: backButtonDispatcher,
      builder: switch (PlatformUtil.operatingSystem) {
        .macos || .linux || .windows => (_, child) => Window(child),
        _ => builder,
      },
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      debugShowWidgetInspector: debugShowWidgetInspector,
      exitWidgetSelectionButtonBuilder: exitWidgetSelectionButtonBuilder,
      home: home,
      initialRoute: initialRoute,
      key: key,
      locale: locale,
      localeListResolutionCallback: localeListResolutionCallback,
      localeResolutionCallback: localeResolutionCallback,
      localizationsDelegates: localizationsDelegates,
      moveExitWidgetSelectionButtonBuilder:
          moveExitWidgetSelectionButtonBuilder,
      navigatorObservers: navigatorObservers,
      navigatorKey: navigatorKey,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onGenerateRoute: onGenerateRoute,
      onGenerateTitle: onGenerateTitle,
      onNavigationNotification: onNavigationNotification,
      onUnknownRoute: onUnknownRoute,
      pageRouteBuilder:
          pageRouteBuilder ??
          <T>(settings, builder) => PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, _, _) => builder(context),
          ),
      restorationScopeId: restorationScopeId,
      routeInformationParser: routeInformationParser,
      routeInformationProvider: routeInformationProvider,
      routes: routes,
      routerConfig: routerConfig,
      routerDelegate: routerDelegate,
      showSemanticsDebugger: showSemanticsDebugger,
      showPerformanceOverlay: showPerformanceOverlay,
      shortcuts: shortcuts,
      supportedLocales: supportedLocales,
      tapBehaviorButtonBuilder: tapBehaviorButtonBuilder,
      textStyle: textStyle,
    ),
  );
}
