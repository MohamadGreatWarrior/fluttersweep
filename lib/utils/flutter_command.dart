import 'dart:io';

String get flutterCommand {
  if (Platform.isWindows) {
    return 'flutter.bat';
  }
  return 'flutter';
}
