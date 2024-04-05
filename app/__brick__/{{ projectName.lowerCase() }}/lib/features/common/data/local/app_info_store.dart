import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppInfoStore {
  late SharedPreferences prefs;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<AppInfo> get() async {
    final bool isFirstTime = prefs.getBool(_keyIsFirstTime) ?? true;
    final int oldVersionCode = prefs.getInt(_keyVersionCode) ?? 1;
    final int versionCode = await currentVersionCode();
    return AppInfo(isFirstTime, oldVersionCode, versionCode);
  }

  Future<void> save(
      {required bool isFirstTime, required int versionCode}) async {
    await prefs.setBool(_keyIsFirstTime, isFirstTime);
    await prefs.setInt(_keyVersionCode, versionCode);
  }

  Future<int> currentVersionCode() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return int.parse(packageInfo.buildNumber);
  }

  Future<String> currentVersionFull() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return '${packageInfo.version} (${packageInfo.buildNumber})';
  }

  Future<String> currentVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  Future<String> storeAppId() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.packageName;
  }

  Future<void> saveTrackLogsInFile(bool trackLogsInFile) async {
    await prefs.setBool(_keyTrackLogsInFile, trackLogsInFile);
  }

  bool trackLogsInFile() {
    return prefs.getBool(_keyTrackLogsInFile) ?? false;
  }
}

const String _keyIsFirstTime = 'isFirstTime';
const String _keyVersionCode = 'versionCode';
const String _keyTrackLogsInFile = 'track_logs_in_file';

class AppInfo {
  AppInfo(this.isFirstTime, this.oldVersionCode, this.currentVersionCode);

  final bool isFirstTime;
  final int oldVersionCode;
  final int currentVersionCode;
}
