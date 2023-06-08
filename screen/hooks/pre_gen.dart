import 'package:mason/mason.dart';
import 'package:shared_hook_methods/fetch_pubspec.dart';
import 'package:shared_hook_methods/get_project_name.dart';

void run(HookContext context) {
  final pubspec = fetchPubspec();

  context.vars['project'] = getProjectName(pubspec, 'ui');
}
