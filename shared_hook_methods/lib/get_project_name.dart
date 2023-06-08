import 'package:pubspec_parse/pubspec_parse.dart';

String getProjectName(Pubspec? pubspec, String package) {
  var project = 'internal';

  if (pubspec == null) {
    return project;
  }

  if (pubspec.name.endsWith(package)) {
    final parts = pubspec.name.split('_');
    parts.removeLast();

    project = parts.join('_');
  }

  return project;
}
