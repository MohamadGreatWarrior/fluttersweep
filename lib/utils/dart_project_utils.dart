import 'dart:io';

List<Directory> listDartProjects(List<Directory> directories) {
  final dartProjects = <Directory>[];

  try {
    for (final dir in directories) {
      if (isDartProject(dir)) dartProjects.add(dir);
      final subs = dir.listSync(recursive: true, followLinks: false);

      for (final sub in subs) {
        if (sub is Directory && isDartProject(sub)) {
          dartProjects.add(sub);
        }
      }
    }
  } catch (e) {
    print('Error: $e');
  }

  return dartProjects;
}

bool isDartProject(Directory directory) {
  final pubspecFile = File('${directory.path}/pubspec.yaml');
  final libDir = Directory('${directory.path}/lib');

  return pubspecFile.existsSync() && libDir.existsSync();
}

bool isFlutterProjectBuilt(Directory directory) {
  final buildDir = Directory('${directory.path}/build');

  return buildDir.existsSync();
}
