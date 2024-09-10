import 'dart:io';

import 'package:path/path.dart';

part 'linux_file_system_manager.dart';

part 'mac_file_system_manager.dart';

part 'windows_file_system_manager.dart';

abstract class FileSystemManager {
  const FileSystemManager();

  factory FileSystemManager.impl() {
    if (Platform.isWindows) {
      return WindowsFileSystemManager();
    } else if (Platform.isMacOS) {
      return MacFileSystemManager();
    } else if (Platform.isLinux) {
      return LinuxFileSystemManager();
    } else {
      throw 'Unsupported platform';
    }
  }

  Future<List<Directory>> listDirectories();

  bool excludeDir(Directory dir);

  List<Directory> _fetchDirectories(Directory dir) {
    final directories = <Directory>[];

    dir.listSync(recursive: false, followLinks: false).forEach(
      (entity) {
        if (entity is Directory && !excludeDir(entity)) {
          directories.add(entity);
        }
      },
    );

    return directories;
  }
}
