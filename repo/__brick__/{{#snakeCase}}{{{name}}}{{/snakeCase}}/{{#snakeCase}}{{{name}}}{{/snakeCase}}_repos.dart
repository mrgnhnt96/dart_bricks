import 'package:data/util/request_result.dart';
import 'package:domain/domain.dart';

abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache {
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}});

  Future<RequestResult<void>> saveAll(List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s);

  Future<Stream<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> watchAll();

  Future<Stream<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> watchById(String id);
}

abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}Source {
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}});
}
