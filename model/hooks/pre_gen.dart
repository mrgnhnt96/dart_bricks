import 'package:mason/mason.dart';

void run(HookContext context) {
  final isObject = context.vars['type'] == 'Object';
  final isRepository = context.vars['type'] == 'Repository';

  // replace the `name` variable with the singular form of the `name` variable
  // e.g. `users` -> `user`

  final name = context.vars['name'] as String?;

  assert(name != null, 'name is null');
  context.vars = {
    ...context.vars,
    'name': name!.replaceAll(RegExp(r's$'), ''),
  };

  context.vars = {
    ...context.vars,
    if (isObject) 'is_object': true,
    if (isRepository) 'is_repository': true,
  };

  // prompt for copyWith is Object
  if (isObject) {
    _handleCpWith(context);
    return;
  }

  // prompt for whether to use Dio or Firebase
  if (isRepository) {
    _handleDioOrFirebase(context);
    return;
  }
}

void _handleCpWith(HookContext context) {
  final copyWith = context.logger.confirm('Use copyWith?', defaultValue: true);

  context.vars = {
    ...context.vars,
    if (copyWith) 'copy_with': true,
  };
}

void _handleDioOrFirebase(HookContext context) {
  final dioOrFirebase = context.logger.chooseOne(
    'Use Dio or Firebase?',
    choices: [
      'Firebase',
      'Dio',
    ],
    defaultValue: 'Firebase',
  );

  final isDio = dioOrFirebase == 'Dio';
  final isFirebase = dioOrFirebase == 'Firebase';

  context.vars = {
    ...context.vars,
    if (isDio) 'is_dio': true,
    if (isFirebase) 'is_firebase': true,
  };
}
