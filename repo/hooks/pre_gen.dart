import 'package:mason/mason.dart';
import 'package:shared_hook_methods/check_for_dependencies.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';
import 'package:shared_hook_methods/make_plural.dart';
import 'package:shared_hook_methods/make_singular.dart';
import 'package:shared_hook_methods/symbols.dart';
import 'package:shared_hook_methods/verify_changes.dart';

part 'utils/__get_interface_and_name.dart';

void run(HookContext context) {
  final pubspec = fetchPubspec();

  context.vars['project'] = getProjectName(pubspec, 'data');

  final data = getInterfaceAndName(context.logger);

  context.vars['interface'] = data.interface;
  context.vars['singular'] = data.singular;
  context.vars['plural'] = data.plural;

  final deps = checkForDependencies(
    pubspec,
    context.logger,
    {'cloud_firestore', 'dio'},
  );

  final isFirebase = deps[0];
  final isDio = deps[1];

  context.vars = {
    ...context.vars,
    'is_firebase': isFirebase,
    'is_dio': isDio,
  };

  const interfaces = [
    'source',
    'cache',
  ];

  // ask which interfaces the repo should implement
  final results = context.logger.chooseAny(
    'Which interfaces should should be generated?',
    choices: interfaces,
    defaultValues: interfaces,
  );

  for (final result in results) {
    context.vars[result] = true;
  }

  // ask which methods the source interface should contain
  final methods = {
    'all': 'all',
    'byId': 'by_id',
    'create': 'create',
    'delete': 'delete',
    'update': 'update',
    'updateMany': 'update_many',
    if (isFirebase) ...{
      'watchAll': 'watch_all',
      'watchById': 'watch_by_id',
    }
  };

  final keys = methods.keys.toList();

  final sourceMethods = context.logger.chooseAny(
    'Which methods should the source interface contain?',
    choices: keys,
    defaultValues: keys,
  );

  for (final method in sourceMethods) {
    context.vars[methods[method]!] = true;
  }
}
