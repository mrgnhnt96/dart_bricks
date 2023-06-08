import 'package:mason/mason.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:shared_hook_methods/symbols.dart';

List<bool> checkForDependencies(
  Pubspec? pubspec,
  Logger logger,
  Set<String> deps, {
  bool prompt = true,
}) {
  final containsDeps = List.generate(deps.length, (_) => false);

  if (pubspec == null) {
    return containsDeps;
  }

  for (var i = 0; i < deps.length; i++) {
    final dep = deps.elementAt(i);

    if (pubspec.dependencies.containsKey(dep.snakeCase)) {
      containsDeps[i] = true;
    }
  }

  if (prompt && containsDeps.every((e) => e == containsDeps.first)) {
    final choice = logger.chooseOne(
      '$question With which dependency would you like to use?',
      choices: deps.toList(),
      display: (e) => e.titleCase,
      defaultValue: deps.first,
    );

    final index = deps.toList().indexOf(choice);

    containsDeps.clear();

    containsDeps.addAll(List.generate(
      deps.length,
      (i) => i == index,
    ));
  }

  return containsDeps;
}
