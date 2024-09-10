part of 'file_system_manager.dart';

class MacFileSystemManager extends FileSystemManager {
  MacFileSystemManager();

  @override
  Future<List<Directory>> listDirectories() async {
    final path = Platform.environment['HOME'];

    if (path == null) {
      throw 'Could not determine the user home directory.';
    }

    final homeDirectory = Directory(path);
    return _fetchDirectories(homeDirectory);
  }

  @override
  bool excludeDir(Directory dir) {
    final lastDir = basename(dir.path);

    switch (lastDir) {
      case 'Library':
      case 'Applications':
      case 'usr':
      case 'System':
      case 'Volumes':
      case 'private':
      case 'dev':
      case 'net':
      case 'Network':
        return true;
      default:
        if (lastDir.startsWith('.')) {
          return true;
        }
        return false;
    }
  }
}
