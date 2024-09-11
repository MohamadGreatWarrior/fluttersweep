import 'dart:io';

import 'package:fluttersweep/utils/dart_project_utils.dart';
import 'package:fluttersweep/utils/flutter_command.dart';

Future<void> sweep(List<Directory> dartProjects) async {
  try {
    for (final project in dartProjects) {
      if (!isFlutterProjectBuilt(project)) continue;

      print('Cleaning project: ${project.path} 🧹');
      print('-----------------');
      var result = await Process.run(
        flutterCommand,
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
