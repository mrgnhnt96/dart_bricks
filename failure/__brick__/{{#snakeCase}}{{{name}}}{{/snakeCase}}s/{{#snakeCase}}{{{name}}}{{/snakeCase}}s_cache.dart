import 'package:internal_domain/domain.dart';

import 'package:internal_data/repos/all_cache/all_cache_repos.dart';
import 'package:internal_data/repos/all_cache/database.dart';
import 'package:internal_data/repos/{{#snakeCase}}{{{name}}}{{/snakeCase}}s/{{#snakeCase}}{{{name}}}{{/snakeCase}}s_repos.dart';
import 'package:internal_data/utils/hive_cache.dart';
import 'package:internal_data/utils/request_result.dart';

// ignore: strict_raw_type
class {{#pascalCase}}{{{name}}}{{/pascalCase}}sCache extends HiveCache<Map>
    implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}sCache, ICache {
  {{#pascalCase}}{{{name}}}{{/pascalCase}}sCache() : super(Database.{{#camelCase}}{{{name}}}{{/camelCase}}s);

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> all() async {
    final {{#camelCase}}{{{name}}}{{/camelCase}}s = <{{#pascalCase}}{{{name}}}{{/pascalCase}}>[];

    final db = await cache();

    for (var i = 0; i < db.length; i++) {
      try {
        final value = db.values.elementAt(i);

        {{#camelCase}}{{{name}}}{{/camelCase}}s.add(
          {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await db.deleteAt(i);
      }
    }

    return RequestResult.success({{#camelCase}}{{{name}}}{{/camelCase}}s);
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>> byId(String id) async {
    final db = await cache();

    final value = db.get(id);

    if (value == null) {
      return const RequestResult.failure('{{#pascalCase}}{{{name}}}{{/pascalCase}} not found');
    }

    try {
      return RequestResult.success(
        {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(
          Map<String, dynamic>.from(value),
        ),
      );
    } catch (_) {
      await db.delete(id);

      return const RequestResult.failure('{{#pascalCase}}{{{name}}}{{/pascalCase}} not found');
    }
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      final db = await cache();

      await db.delete(id);
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> deleteAll([Set<String>? ids]) async {
    try {
      final db = await cache();

      if (ids == null) {
        await db.clear();
      } else {
        await db.deleteAll(ids);
      }
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> save({{#pascalCase}}{{{name}}}{{/pascalCase}} {{#camelCase}}{{{name}}}{{/camelCase}}) async {
    try {
      final db = await cache();

      await db.put({{#camelCase}}{{{name}}}{{/camelCase}}.id, {{#camelCase}}{{{name}}}{{/camelCase}}.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(
    List<{{#pascalCase}}{{{name}}}{{/pascalCase}}> {{#camelCase}}{{{name}}}{{/camelCase}}s,
  ) async {
    try {
      final entries = {{#camelCase}}{{{name}}}{{/camelCase}}s.asMap().map(
        (index, {{#camelCase}}{{{name}}}{{/camelCase}}) => MapEntry(
          {{#camelCase}}{{{name}}}{{/camelCase}}.id,
          {{#camelCase}}{{{name}}}{{/camelCase}}.toJson(),
        ),
      );

      final db = await cache();

      await db.putAll(entries);
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchAll() async {
    final db = await cache();

    final stream = db.watch();

    return stream.asyncMap<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>(
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
            {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(
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
  Future<Stream<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>> watchById(String id) async {
    final db = await cache();

    final stream = db.watch(key: id);

    return stream.asyncMap<StreamResult<{{#pascalCase}}{{{name}}}{{/pascalCase}}>>(
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
            {{#pascalCase}}{{{name}}}{{/pascalCase}}.fromJson(
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
