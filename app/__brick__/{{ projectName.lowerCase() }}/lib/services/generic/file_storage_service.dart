import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class FileStorageService {
  late Directory cacheDir;
  late Directory appSupportDir;
  late Directory appDataDir;
  late Directory downloadsDir;

  Future<void> init() async {
    cacheDir = await getTemporaryDirectory();
    // Create inner cache directory so you can delete all files in it without affecting the caches of other plugins such as Crashlytics on iOS
    cacheDir =
        await Directory('${cacheDir.path}/inner').create(recursive: true);
    appSupportDir = await getApplicationSupportDirectory();
    appDataDir = await getApplicationDocumentsDirectory();
    await _initDownloadsDir();
  }

  Future<void> _initDownloadsDir() async {
    if (!Platform.isAndroid) {
      downloadsDir = appDataDir;
    } else {
      Directory? dir;
      dir = Directory('/storage/emulated/0/Download/');
      if (!(await dir.exists())) {
        dir = Directory('/storage/emulated/0/Downloads/');
        if (!(await dir.exists())) {
          dir = null;
        }
      }
      // LATER: Maybe use some external storage directory for Android
      downloadsDir = dir ?? appDataDir;
    }
  }

  File cacheFile(String fileName) {
    return File('${cacheDir.path}/$fileName');
  }

  File randomCacheFile({required String extension}) {
    return cacheFile('${Uuid().v1()}.$extension');
  }

  Directory cacheDirectory(String dirName) {
    return Directory('${cacheDir.path}/$dirName');
  }

  Directory randomCacheDirectory() {
    return cacheDirectory(Uuid().v1());
  }

  File appSupportFile(String fileName) {
    return File('${appSupportDir.path}/$fileName');
  }

  File appDataFile(String fileName) {
    return File('${appDataDir.path}/$fileName');
  }

  File randomAppDataFile({required String extension}) {
    return appDataFile('${Uuid().v1()}.$extension');
  }

  Directory appDataDirectory(String fileName) {
    return Directory('${appDataDir.path}/$fileName');
  }

  File downloadsFile(String fileName) {
    return File('${downloadsDir.path}/$fileName');
  }

  Future<File> saveFileFromAssets(
      String assetName, FileLocation location) async {
    final String fileName = assetName.split('/').last;
    final File file = _file(fileName, location);
    // ignore: avoid_slow_async_io
    if (!await file.exists()) {
      final ByteData bytes = await rootBundle.load(assetName);
      return await file.writeAsBytes(bytes.buffer.asInt8List());
    } else {
      return file;
    }
  }

  Future<String> loadStringFromAssets(String assetName) {
    return rootBundle.loadString(assetName);
  }

  Future<File> saveFileFromBytes(
    Uint8List bytes, {
    required String fileName,
    required FileLocation location,
    bool override = true,
  }) async {
    final File file = _file(fileName, location);
    // ignore: avoid_slow_async_io
    if (override || !await file.exists()) {
      return await file.writeAsBytes(bytes, flush: true);
    } else {
      return file;
    }
  }

  Future<File> saveFileFromString(
    String s, {
    required String fileName,
    required FileLocation location,
  }) async {
    final File file = _file(fileName, location);
    return await file.writeAsString(s);
  }

  File _file(String fileName, FileLocation location) {
    switch (location) {
      case FileLocation.cache:
        return cacheFile(fileName);
      case FileLocation.appSupport:
        return appSupportFile(fileName);
      case FileLocation.appData:
        return appDataFile(fileName);
      case FileLocation.downloads:
        return downloadsFile(fileName);
      case FileLocation.absolutePath:
        return File(fileName);
    }
  }

  Future<void> deleteFile(String path) async {
    await File(path).delete();
  }

  Future<void> deleteDirectory(String path) async {
    await File(path).delete(recursive: true);
  }

  Future<void> clearCache() async {
    cacheDir.list().forEach((it) async {
      if (it is File) {
        await it.delete();
      } else if (it is Directory) {
        await it.delete(recursive: true);
      }
    });
  }
}

enum FileLocation { cache, appSupport, appData, downloads, absolutePath }

// ignore: unused_element
final Logger _logger = Logger('FileStorageService');
