import 'package:flutter_sweep/file_system_manager/file_system_manager.dart';
import 'package:flutter_sweep/utils/dart_project_utils.dart';
import 'package:flutter_sweep/utils/sweep.dart';

Future<void> run() async {
  print('You may be faced with prompts to allow access to directories.');
  print('Please accept them so the command can proceed.');
  print('\n');
  print('Searching for Flutter projects...');

  final fileSystemManager = FileSystemManager.impl();
  final directories = await fileSystemManager.listDirectories();
  final dartProjects = listDartProjects(directories);

  await sweep(dartProjects);
}
