part of 'file_system_manager.dart';

class LinuxFileSystemManager extends FileSystemManager {
  @override
  Future<List<Directory>> listDirectories() async {
    final path =
        Platform.environment['HOME'] ?? Platform.environment['USERPROFILE'];

    if (path == null) {
      throw 'Could not determine the user home directory.';
    }

    final homeDirectory = Directory(path);
    return _fetchDirectories(homeDirectory);
  }

  @override
  bool excludeDir(Directory dir) {
    final lastDir = basename(dir.path);

    if (lastDir.startsWith('.')) {
      return true;
    }
    return false;
  }
}
