import 'package:mason/mason.dart';

void run(HookContext context) {
  final isDio = context.vars['type'] == 'Dio';
  final isFirebase = context.vars['type'] == 'Firebase';

  context.vars = {
    ...context.vars,
    'is_dio': isDio,
    'is_firebase': isFirebase,
  };
}
