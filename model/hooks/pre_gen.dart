import 'package:mason/mason.dart';
import 'package:shared_hook_methods/check_for_dependencies.dart';
import 'package:shared_hook_methods/directory_name_contains.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';

part 'utils/__update_name_to_plural.dart';
part 'utils/__use_copy_with.dart';

void run(HookContext context) {
  context.vars['name'] =
      updateNameToPlural(context.vars['name']!, context.logger);

  final pubspec = fetchPubspec();

  final hasCopyWithDep = checkForDependencies(
    pubspec,
    context.logger,
    {'copy_with_extension'},
    prompt: false,
  ).first;

  //

  if (hasCopyWithDep && useCopyWith(context.logger)) {
    context.vars['copy_with'] = true;
  }

  final isRepo = directoryNameContains('repo');

  if (isRepo) {
    context.vars['is_repository'] = true;

    final deps = checkForDependencies(
      pubspec,
      context.logger,
      {'cloud_firestore', 'Dio'},
    );

    context.vars.addAll({
      'is_firebase': deps[0],
      'is_dio': deps[1],
    });
  } else {
    context.vars['is_object'] = true;
  }

  context.vars['project'] = getProjectName(pubspec);
}
