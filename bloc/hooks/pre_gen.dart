import 'package:mason/mason.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';

void run(HookContext context) {
  final isPlural = context.vars['type'] == 'Plural';
  final isSingular = context.vars['type'] == 'Singular';
  final isBasic = context.vars['type'] == 'Basic';

  context.vars = {
    ...context.vars,
    if (isPlural) 'is_plural': true,
    if (isSingular) 'is_singular': true,
    if (isBasic) 'is_basic': true,
  };

  final pubspec = fetchPubspec();

  context.vars['project'] = getProjectName(pubspec, 'application');
}
