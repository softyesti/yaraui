part of 'info_service.dart';

/// Default implementation of [InfoService].
class _DefaultInfoService extends InfoService {
  /// Default implementation of [InfoService].
  _DefaultInfoService._();

  late final PackageInfo _packageInfo;

  @override
  Future<InfoService> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    return this;
  }

  @override
  String get name => _packageInfo.appName;

  @override
  String get package => _packageInfo.packageName;

  @override
  String get version => _packageInfo.version;

  @override
  Future<void> dispose() async {}
}
