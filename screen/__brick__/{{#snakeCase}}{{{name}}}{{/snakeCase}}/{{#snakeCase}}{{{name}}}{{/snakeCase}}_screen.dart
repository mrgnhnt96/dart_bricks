import 'package:flutter/material.dart';

import 'package:{{#snakeCase}}{{{project}}}{{/snakeCase}}_ui/screens/{{#snakeCase}}{{{name}}}{{/snakeCase}}/{{#snakeCase}}{{{name}}}{{/snakeCase}}_view.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Screen extends StatelessWidget {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const {{#pascalCase}}{{{name}}}{{/pascalCase}}View();
  }
}
