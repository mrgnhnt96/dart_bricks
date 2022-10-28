import '../../util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache extends HiveCache<Map> implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache() : super('{{#snakeCase}}{{{name}}}{{/snakeCase}}', byUser: {{byUser}});

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all() async {
    await cacheInit();

    throw UnimplementedError('all() has not been implemented.');
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id) async {
    await cacheInit();

    throw UnimplementedError('byId() has not been implemented.');
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    await cacheInit();

    throw UnimplementedError('delete() has not been implemented.');
  }

  @override
  Future<RequestResult<void>> deleteAll() async {
    await cacheInit();

    throw UnimplementedError('deleteAll() has not been implemented.');
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    await cacheInit();

    throw UnimplementedError('save() has not been implemented.');
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> saveAll(
      List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s) async {
    await cacheInit();

    throw UnimplementedError('saveAll() has not been implemented.');
  }
}
