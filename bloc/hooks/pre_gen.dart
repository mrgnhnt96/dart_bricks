import 'package:mason/mason.dart';

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
}
