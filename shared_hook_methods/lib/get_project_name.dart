import 'package:pubspec_parse/pubspec_parse.dart';

String getProjectName(Pubspec? pubspec) {
  var project = 'internal';

  if (pubspec == null) {
    return project;
  }

  if (pubspec.name.endsWith('data')) {
    final parts = pubspec.name.split('_')..removeLast();

    project = parts.join('_');
  }

  return project;
}
