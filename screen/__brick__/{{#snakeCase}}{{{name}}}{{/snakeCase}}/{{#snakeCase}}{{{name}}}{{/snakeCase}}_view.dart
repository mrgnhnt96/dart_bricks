import 'package:flutter/material.dart';

part 'components/__description.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
          const _Description(),
          ElevatedButton(
            onPressed: () {}
            child: const Text('Do something'),
          ),
      ],
    ),
  }
}
