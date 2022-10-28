import '../../util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';

class _Keys {
  const _Keys._();

  static const {{#camelCase}}{{{name}}}{{/camelCase}} = '{{#snakeCase}}{{{name}}}{{/snakeCase}}';
}

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache extends HiveCache<Map> implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache {
  const {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache() : super(_Keys.{{#camelCase}}{{{name}}}{{/camelCase}}, byUser: {{byUser}});

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all() async {
    await cacheInit();

    final {{#camelCase}}{{{model}}}{{/camelCase}}s = <{{#pascalCase}}{{{model}}}{{/pascalCase}}>[];

    for (var i = 0; i < cache.length; i++) {
      try {
        final value = cache.values.elementAt(i);

        {{#camelCase}}{{{model}}}{{/camelCase}}s.add(
          {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await cache.deleteAt(i);
      }
    }

    return {{#camelCase}}{{{model}}}{{/camelCase}}s;
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id) async {
    await cacheInit();

    final value = cache.get(id);

    if (value == null) {
      return RequestResult.failure('{{#pascalCase}}{{{model}}}{{/pascalCase}} not found');
    }

    try {
      return RequestResult.success(
        {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
          Map<String, dynamic>.from(value),
        ),
      );
    } catch (_) {
      await cache.delete(id);

      return RequestResult.failure('{{#pascalCase}}{{{model}}}{{/pascalCase}} not found');
    }
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    await cacheInit();

    try {
      await cache.delete(id);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> deleteAll() async {
    await cacheInit();

    try {
      await cache.clear();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    await cacheInit();

    try {
      await cache.put({{#camelCase}}{{{model}}}{{/camelCase}}.id, {{#camelCase}}{{{model}}}{{/camelCase}}.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> saveAll(
      List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s) async {
    await cacheInit();

    try {
      final entries = {{#camelCase}}{{{model}}}{{/camelCase}}s.asMap().map(
        (index, {{#camelCase}}{{{model}}}{{/camelCase}}) => MapEntry(
          {{#camelCase}}{{{model}}}{{/camelCase}}.id,
          {{#camelCase}}{{{model}}}{{/camelCase}}.toJson(),
        ),
      );

      await cache.putAll(entries);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}
