import 'package:internal_domain/domain.dart';

import 'package:internal_data/utils/request_result.dart';

abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}sCache {
  Future<RequestResult<List<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save({{#pascalCase}}{{{name}}}{{/pascalCase}} {{#camelCase}}{{{name}}}{{/camelCase}});

  Future<RequestResult<void>> saveAll(List<{{#pascalCase}}{{{name}}}{{/pascalCase}}> {{#camelCase}}{{{name}}}{{/camelCase}}s);

  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchAll();

  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchById(String id);
}

{{#is_firebase}}
abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}sSource {
  Future<RequestResult<List<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> all();

  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> byId(String id);

  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> create();

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update({{#pascalCase}}{{{name}}}{{/pascalCase}} {{#camelCase}}{{{name}}}{{/camelCase}});

  Future<RequestResult<void>> updateMany(List<{{#pascalCase}}{{{name}}}{{/pascalCase}}> {{#camelCase}}{{{name}}}{{/camelCase}}s);

  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchById(String id);
}

{{/is_firebase}}
{{#is_dio}}
abstract class I{{#pascalCase}}{{{name}}}{{/pascalCase}}Source {
  Future<RequestResult<List<_MODEL_PASCAL>>> all();

  Future<RequestResult<_MODEL_PASCAL>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update(_MODEL_PASCAL _MODEL_CAMEL);
}
{{/is_dio}}