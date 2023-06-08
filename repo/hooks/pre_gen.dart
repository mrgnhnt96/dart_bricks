import 'package:mason/mason.dart';
import 'package:shared_hook_methods/check_for_dependencies.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';

void run(HookContext context) {
  final pubspec = fetchPubspec();

  context.vars['project'] = getProjectName(pubspec);

  final deps = checkForDependencies(
    pubspec,
    context.logger,
    {'Firebase', 'Dio'},
  );

  context.vars = {
    ...context.vars,
    'is_firebase': deps[0],
    'is_dio': deps[1],
  };
}
