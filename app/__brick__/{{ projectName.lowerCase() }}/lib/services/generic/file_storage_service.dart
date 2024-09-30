import 'package:flutter/services.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:universal_io/io.dart';
import 'package:uuid/uuid.dart';

class FileStorageService {
  late Directory cacheDir;
  late Directory appSupportDir;
  late Directory appDocumentsDir;
  late Directory downloadsDir;

  Future<void> init() async {
    cacheDir = await getTemporaryDirectory();
    // Create inner cache directory so you can delete all files in it without affecting the caches of other plugins such as Crashlytics on iOS
    cacheDir =
        await Directory(join(cacheDir.path, 'inner')).create(recursive: true);
    appSupportDir = await getApplicationSupportDirectory();
    appDocumentsDir = await getApplicationDocumentsDirectory();
    if (Platform.isMacOS || Platform.isWindows) {
      // If non-sandboxed macOS or Windows app, the Documents directory is too visible to the user
      appDocumentsDir = appSupportDir;
    }
    await _initDownloadsDir();
  }

  Future<void> _initDownloadsDir() async {
    if (Platform.isAndroid) {
      Directory? dir;
      dir = Directory('/storage/emulated/0/Download/');
      if (!(await dir.exists())) {
        dir = Directory('/storage/emulated/0/Downloads/');
        if (!(await dir.exists())) {
          dir = null;
        }
      }
      // LATER: Maybe use some external storage directory for Android
      downloadsDir = dir ?? appDocumentsDir;
    } else {
      downloadsDir = appDocumentsDir;
    }
  }

  File cacheFile(String fileName) {
    return File(join(cacheDir.path, fileName));
  }

  File randomCacheFile({required String extension}) {
    return cacheFile('${Uuid().v1()}.$extension');
  }

  Directory cacheDirectory(String dirName) {
    return Directory(join(cacheDir.path, dirName));
  }

  Directory randomCacheDirectory() {
    return cacheDirectory(Uuid().v1());
  }

  File appSupportFile(String fileName) {
    return File(join(appSupportDir.path, fileName));
  }

  File appDocumentsFile(String fileName) {
    return File(join(appDocumentsDir.path, fileName));
  }

  File randomAppDocumentsFile({required String extension}) {
    return appDocumentsFile('${Uuid().v1()}.$extension');
  }

  Directory appDocumentsDirectory(String dirName) {
    return Directory(join(appDocumentsDir.path, dirName));
  }

  File downloadsFile(String fileName) {
    return File(join(downloadsDir.path, fileName));
  }

  Future<File> saveFileFromAssets(
      String assetName, FileLocation location) async {
    // Asset paths use Unix separator / everywhere even on Windows
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
      case FileLocation.appDocuments:
        return appDocumentsFile(fileName);
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
