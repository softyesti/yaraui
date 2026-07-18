part of 'info_service.dart';

/// Implementation of [InfoService] using the `package_info_plus` package.
class _PackageInfoService extends InfoService {
  /// Creates a new [_PackageInfoService].
  _PackageInfoService();

  late final PackageInfo _packageInfo;

  @override
  Future<_PackageInfoService> init() async {
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
