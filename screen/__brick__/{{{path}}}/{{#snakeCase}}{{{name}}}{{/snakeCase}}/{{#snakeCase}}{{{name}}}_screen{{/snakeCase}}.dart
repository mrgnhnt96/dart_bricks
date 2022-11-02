import 'package:flutter/material.dart';

import 'package:ui/{{{path}}}/{{#snakeCase}}{{{name}}}{{/snakeCase}}_view.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Screen extends StatelessWidget {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{#titleCase}}{{{name}}}{{/titleCase}}'),
      ),
      body: const {{#pascalCase}}{{{name}}}{{/pascalCase}}View(),
    );
  }
}
