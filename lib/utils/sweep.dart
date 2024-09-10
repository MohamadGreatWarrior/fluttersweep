import 'dart:io';

import 'package:flutter_sweep/utils/dart_project_utils.dart';

Future<void> sweep(List<Directory> dartProjects) async {
  try {
    for (final project in dartProjects) {
      if (!isFlutterProjectBuilt(project)) continue;

      print('Cleaning project: ${project.path} 🧹');
      print('-----------------');
      var result = await Process.run(
        'flutter',
        ['clean'],
        workingDirectory: project.path,
      );

      print(result.stdout);
      print(result.stderr);
    }
  } catch (e) {
    print('Error: $e');
  }
}
