import '../../util/request_result.dart';
import 'package:domain/domain.dart';

abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache {
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll();

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}});

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> saveAll(
      List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s);
}

abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}Source {
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> update({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}});
}
