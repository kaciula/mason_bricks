import 'package:universal_io/io.dart';

import 'string_extension.dart';

extension FileExt on File {
  String get fileName => path.split(Platform.pathSeparator).last;

  String get fileNameWithoutExtension {
    final List<String> splits = fileName.split('.');
    return splits.first;
  }

  String? get fileExtension {
    final List<String> splits = fileName.split('.');
    return splits.length > 1 ? splits.last : null;
  }

  bool get hasVideoExtension =>
      path.endsWithIgnoreCase('.mp4') || path.endsWithIgnoreCase('.mov');

  String get directoryPath =>
      path.substring(0, path.lastIndexOf(Platform.pathSeparator));

  Future<File> safeRename(String path) async {
    if (Platform.isAndroid) {
      // On Android rename does not work if 2 different file systems are being used
      final File file = await copy(path);
      delete();
      return file;
    } else {
      return rename(path);
    }
  }

  Future<FileSystemEntity> safeDelete() async {
    final bool doesExist = await exists();
    if (doesExist) {
      return delete();
    }
    return this;
  }
}

extension FileSystemEntityExt on FileSystemEntity {
  String get fileName => path.split(Platform.pathSeparator).last;

  String get fileNameWithoutExtension {
    final List<String> splits = fileName.split('.');
    return splits.first;
  }

  String? get fileExtension {
    final List<String> splits = fileName.split('.');
    return splits.length > 1 ? splits.last : null;
  }

  bool get hasVideoExtension =>
      path.endsWithIgnoreCase('.mp4') || path.endsWithIgnoreCase('.mov');
}
