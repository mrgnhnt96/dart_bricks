import '../../util/request_result.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Source implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Source {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Source();

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all() async {
    throw UnimplementedError('all() has not been implemented.');
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id) async {
    throw UnimplementedError('byId() has not been implemented.');
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    throw UnimplementedError('delete() has not been implemented.');
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> update(
      {{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    throw UnimplementedError('update() has not been implemented.');
  }
}
