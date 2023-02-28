import 'package:mason/mason.dart';

void run(HookContext context) {
  final isPlural = context.vars['type'] == 'plural';
  final isSingular = context.vars['type'] == 'singular';
  final isBasic = context.vars['type'] == 'basic';

  context.vars = {
    ...context.vars,
    if (isPlural) 'is_plural': true,
    if (isSingular) 'is_singular': true,
    if (isBasic) 'is_basic': true,
  };
}
