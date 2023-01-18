part of '../{{#snakeCase}}{{{name}}}{{/snakeCase}}_view.dart';

class _Description extends StatelessWidget {
  const _Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'this is the {{#titleCase}}{{{name}}}{{/titleCase}} view.',
      ),
    );
  }
}
