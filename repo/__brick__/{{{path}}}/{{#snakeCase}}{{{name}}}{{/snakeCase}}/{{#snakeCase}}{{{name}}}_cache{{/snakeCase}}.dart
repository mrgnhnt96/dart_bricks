import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';

class _Keys {
  const _Keys._();

  static const {{#camelCase}}{{{name}}}{{/camelCase}} = '{{#snakeCase}}{{{name}}}{{/snakeCase}}';
}

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache extends HiveCache<Map> implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache {
  {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache() : super(_Keys.{{#camelCase}}{{{name}}}{{/camelCase}}, byUser: {{byUser}});

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

    return RequestResult.success({{#camelCase}}{{{model}}}{{/camelCase}}s);
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
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> deleteAll() async {
    await cacheInit();

    try {
      await cache.clear();
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    await cacheInit();

    try {
      await cache.put({{#camelCase}}{{{model}}}{{/camelCase}}.id, {{#camelCase}}{{{model}}}{{/camelCase}}.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s) async {
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
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<Stream<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> watchAll() async {
    await cacheInit();

    final stream = cache.watch();

    return stream.asyncMap<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>(
      (event) {
        final key = event.key as String;
        if (event.deleted) {
          return StreamResult.deleted(key);
        }

        final data = event.value as Map?;

        if (data == null) {
          return StreamResult.deleted(key);
        }

        try {
          return StreamResult(
            {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
              Map<String, dynamic>.from(data),
            ),
            key: key,
          );
        } catch (e) {
          return StreamResult.failure('$e');
        }
      },
    );
  }

  @override
  Future<Stream<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> watchById(String id) async {
    await cacheInit();

    final stream = cache.watch(key: id);

    return stream.asyncMap<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>(
      (event) {
        if (event.deleted) {
          return StreamResult.deleted(id);
        }

        final data = event.value as Map?;

        if (data == null) {
          return StreamResult.deleted(id);
        }

        try {
          return StreamResult(
            {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
              Map<String, dynamic>.from(data),
            ),
            key: id,
          );
        } catch (e) {
          return StreamResult.failure('$e');
        }
      },
    );
  }
}
