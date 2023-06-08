import 'dart:io';

import 'package:mason/mason.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

void run(HookContext context) {
  var isDio = false;
  var isFirebase = false;

  var currentDir = Directory.current;

  // search up to 5 levels up for pubspec.yaml
  for (var i = 0; i < 5; i++) {
    final pubspecFile = File('${currentDir.path}/pubspec.yaml');

    if (!pubspecFile.existsSync()) {
      currentDir = currentDir.parent;
      continue;
    }

    // check for dio dependency
    final pubspec = Pubspec.parse(pubspecFile.readAsStringSync());
    final dioDependency = pubspec.dependencies['dio'];

    if (dioDependency != null) {
      isDio = true;
    }

    // check for firestore dependency
    final firebaseDependency = pubspec.dependencies['cloud_firestore'];

    if (firebaseDependency != null) {
      isFirebase = true;
    }
    break;
  }

  if (isDio != isFirebase) {
    context.vars = {
      ...context.vars,
      'is_dio': isDio,
      'is_firebase': isFirebase,
    };
  }

  final choice = context.logger.chooseOne(
    'With which dependency would you like to use for this repo?',
    choices: ['firebase', 'dio'],
    defaultValue: 'firebase',
  );

  context.logger.info('You chose $choice');

  context.vars = {
    ...context.vars,
    'is_dio': choice == 'dio',
    'is_firebase': choice == 'firebase',
  };
  return;
}
