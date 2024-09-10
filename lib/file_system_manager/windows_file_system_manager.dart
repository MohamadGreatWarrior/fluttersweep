part of 'file_system_manager.dart';

class WindowsFileSystemManager extends FileSystemManager {
  @override
  Future<List<Directory>> listDirectories() async {
    final directories = <Directory>[];

    const driveLetters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

    for (var letter in driveLetters.split('')) {
      var drive = '$letter:\\';
      var directory = Directory(drive);

      if (directory.existsSync()) {
        print('Drive found: $drive');
        directories.addAll(_fetchDirectories(directory));
      }
    }

    return directories;
  }

  @override
  bool excludeDir(Directory dir) {
    final lastDir = basename(dir.path);

    //TODO: Should the Users directory be excluded?

    switch (lastDir) {
      case 'AppData':
      case 'Program Files':
      case 'Program Files (x86)':
      case 'Windows':
      case 'System32':
      case 'Temp':
      case 'ProgramData':
      case 'Recovery':
      case '\$Recycle.Bin':
      case 'Documents and Settings':
      case 'MSOCache':
      case 'PerfLogs':
      case 'System Volume Information':
        return true;
      default:
        if (lastDir.startsWith('.')) {
          return true;
        }
        return false;
    }
  }
}
