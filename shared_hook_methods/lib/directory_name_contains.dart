import 'dart:io';

bool directoryNameContains(String name) {
  final currentDirectory = Directory.current;

  final dirName = currentDirectory.path.split('/').last;

  return dirName.contains(name);
}
