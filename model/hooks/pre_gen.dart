import 'package:mason/mason.dart';

void run(HookContext context) {
  final isObject = context.vars['type'] == 'Object';
  final isRepository = context.vars['type'] == 'Repository';

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

  // prompt for whether to use dio or firebase
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
    'Use dio or firebase?',
    choices: ['dio', 'firebase'],
    defaultValue: 'dio',
  );

  final isDio = dioOrFirebase == 'dio';
  final isFirebase = dioOrFirebase == 'firebase';

  context.vars = {
    ...context.vars,
    if (isDio) 'is_dio': true,
    if (isFirebase) 'is_firebase': true,
  };
}
