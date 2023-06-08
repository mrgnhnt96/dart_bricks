import 'dart:io';

import 'package:mason/mason.dart';
import 'package:pubspec_parse/pubspec_parse.dart';

void run(HookContext context) {
  final pubspec = fetchPubspec();
  final data = checkForDependencies(pubspec, context.logger);

  var project = 'internal';
  if (pubspec != null) {
    final projectName = pubspec.name;

    if (projectName.endsWith('data')) {
      final parts = projectName.split('_');
      parts.removeLast();

      project = parts.join('_');
    }
  }

  context.vars = {
    ...context.vars,
    'project': project,
    'is_dio': data.dio,
    'is_firebase': data.firebase,
  };
}

Pubspec? fetchPubspec() {
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

    return pubspec;
  }
  return null;
}

({bool firebase, bool dio}) checkForDependencies(
  Pubspec? pubspec,
  Logger logger,
) {
  var isDio = false;
  var isFirebase = false;

  final dioDependency = pubspec?.dependencies['dio'];

  if (dioDependency != null) {
    isDio = true;
  }

  // check for firestore dependency
  final firebaseDependency = pubspec?.dependencies['cloud_firestore'];

  if (firebaseDependency != null) {
    isFirebase = true;
  }

  if (isDio == isFirebase) {
    final choice = logger.chooseOne(
      'With which dependency would you like to use for this repo?',
      choices: ['Firebase', 'Dio'],
      defaultValue: 'Firebase',
    );

    logger.info('You chose $choice');

    isDio = choice == 'Dio';
    isFirebase = choice == 'Firebase';
  }

  return (dio: isDio, firebase: isFirebase);
}
