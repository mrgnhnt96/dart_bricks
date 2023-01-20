import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

part 'components/__description.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}View extends StatelessWidget {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}View({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 16),
        const _Description(),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
          child: const Text('Go Back'),
        ),
      ],
    );
  }
}
