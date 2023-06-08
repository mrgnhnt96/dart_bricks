import 'dart:io';

import 'package:pubspec_parse/pubspec_parse.dart';

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
