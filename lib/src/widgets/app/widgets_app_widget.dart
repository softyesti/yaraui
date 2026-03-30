part of 'app_widget.dart';

class _WidgetsApp extends StatelessWidget {
  const _WidgetsApp({
    required this.color,
    required this.title,
    required this.actions,
    required this.backButtonDispatcher,
    required this.builder,
    required this.debugShowCheckedModeBanner,
    required this.debugShowWidgetInspector,
    required this.exitWidgetSelectionButtonBuilder,
    required this.home,
    required this.initialRoute,
    required super.key,
    required this.locale,
    required this.localeListResolutionCallback,
    required this.localeResolutionCallback,
    required this.localizationsDelegates,
    required this.moveExitWidgetSelectionButtonBuilder,
    required this.navigatorObservers,
    required this.navigatorKey,
    required this.onGenerateInitialRoutes,
    required this.onGenerateRoute,
    required this.onGenerateTitle,
    required this.onNavigationNotification,
    required this.onUnknownRoute,
    required this.pageRouteBuilder,
    required this.restorationScopeId,
    required this.routeInformationParser,
    required this.routeInformationProvider,
    required this.routes,
    required this.routerConfig,
    required this.routerDelegate,
    required this.showSemanticsDebugger,
    required this.showPerformanceOverlay,
    required this.shortcuts,
    required this.supportedLocales,
    required this.tapBehaviorButtonBuilder,
    required this.textStyle,
  });

  final Color color;
  final String? title;
  final Map<Type, Action<Intent>>? actions;
  final BackButtonDispatcher? backButtonDispatcher;
  final Widget Function(BuildContext, Widget?)? builder;
  final bool debugShowCheckedModeBanner;
  final bool debugShowWidgetInspector;
  final Widget Function(
    BuildContext, {
    required GlobalKey<State<StatefulWidget>> key,
    required void Function() onPressed,
    required String semanticsLabel,
  })?
  exitWidgetSelectionButtonBuilder;
  final Widget? home;
  final String? initialRoute;
  final Locale? locale;
  final Locale? Function(List<Locale>?, Iterable<Locale>)?
  localeListResolutionCallback;
  final Locale? Function(Locale?, Iterable<Locale>)? localeResolutionCallback;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required String semanticsLabel,
    bool usesDefaultAlignment,
  })?
  moveExitWidgetSelectionButtonBuilder;
  final List<NavigatorObserver> navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<Route<dynamic>> Function(String)? onGenerateInitialRoutes;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final String Function(BuildContext)? onGenerateTitle;
  final bool Function(NavigationNotification)? onNavigationNotification;
  final Route<dynamic>? Function(RouteSettings)? onUnknownRoute;
  final PageRoute<T> Function<T>(RouteSettings, Widget Function(BuildContext))?
  pageRouteBuilder;
  final String? restorationScopeId;
  final RouteInformationParser<Object>? routeInformationParser;
  final RouteInformationProvider? routeInformationProvider;
  final Map<String, Widget Function(BuildContext)> routes;
  final RouterConfig<Object>? routerConfig;
  final RouterDelegate<Object>? routerDelegate;
  final bool showSemanticsDebugger;
  final bool showPerformanceOverlay;
  final Map<ShortcutActivator, Intent>? shortcuts;
  final Iterable<Locale> supportedLocales;
  final Widget Function(
    BuildContext, {
    required void Function() onPressed,
    required bool selectionOnTapEnabled,
    required String semanticsLabel,
  })?
  tapBehaviorButtonBuilder;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    if (backButtonDispatcher != null ||
        routeInformationParser != null ||
        routeInformationProvider != null ||
        routerConfig != null ||
        routerDelegate != null) {
      return WidgetsApp.router(
        color: color,
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
        moveExitWidgetSelectionButtonBuilder:
            moveExitWidgetSelectionButtonBuilder,
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
    }

    return WidgetsApp(
      color: color,
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
      moveExitWidgetSelectionButtonBuilder:
          moveExitWidgetSelectionButtonBuilder,
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
  }
}
