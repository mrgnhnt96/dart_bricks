import 'package:mason/mason.dart';
import 'package:shared_hook_methods/check_for_dependencies.dart';
import 'package:shared_hook_methods/directory_name_contains.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';
import 'package:shared_hook_methods/make_plural.dart';
import 'package:shared_hook_methods/symbols.dart';

part 'utils/__get_interface_and_name.dart';
part 'utils/__use_copy_with.dart';

void run(HookContext context) {
  final isInterface = directoryNameContains('repo');
  context.vars['is_interface'] = isInterface;

  final data = getInterfaceAndName(context.logger, isInterface: isInterface);

  context.vars['singular'] = data.singular;
  context.vars['plural'] = data.plural;
  context.vars['interface'] = data.interface;

  final pubspec = fetchPubspec();

  if (isInterface) {
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
    const methods = {
      'all': 'all',
      'byId': 'by_id',
      'create': 'create',
      'delete': 'delete',
      'update': 'update',
      'updateMany': 'update_many',
      'watchAll': 'watch_all',
      'watchById': 'watch_by_id',
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
  } else {
    final hasCopyWithDep = checkForDependencies(
      pubspec,
      context.logger,
      {'copy_with_extension'},
      prompt: false,
    ).first;

    if (hasCopyWithDep && useCopyWith(context.logger)) {
      context.vars['copy_with'] = true;
    }
  }

  context.vars['project'] = getProjectName(pubspec, 'domain');
}
