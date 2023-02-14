import 'package:data/repos/all_cache/all_cache_repo.dart';
import 'package:data/repos/all_cache/database.dart';
import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '{{#snakeCase}}{{{name}}}{{/snakeCase}}_repos.dart';

class {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache extends HiveCache<Map>
    implements I{{#pascalCase}}{{{name}}}{{/pascalCase}}Cache, ICache {
  {{#pascalCase}}{{{name}}}{{/pascalCase}}Cache() : super(Database.{{#camelCase}}{{{name}}}{{/camelCase}});

  @override
  Future<RequestResult<List<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> all() async {
    final {{#camelCase}}{{{model}}}{{/camelCase}}s = <{{#pascalCase}}{{{model}}}{{/pascalCase}}>[];

    final db = await cache();

    for (var i = 0; i < db.length; i++) {
      try {
        final value = db.values.elementAt(i);

        {{#camelCase}}{{{model}}}{{/camelCase}}s.add(
          {{#pascalCase}}{{{model}}}{{/pascalCase}}.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await db.deleteAt(i);
      }
    }

    return RequestResult.success({{#camelCase}}{{{model}}}{{/camelCase}}s);
  }

  @override
  Future<RequestResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>> byId(String id) async {
    final db = await cache();

    final value = db.get(id);

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
      await db.delete(id);

      return RequestResult.failure('{{#pascalCase}}{{{model}}}{{/pascalCase}} not found');
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
  Future<RequestResult<void>> save({{#pascalCase}}{{{model}}}{{/pascalCase}} {{#camelCase}}{{{model}}}{{/camelCase}}) async {
    try {
      final db = await cache();

      await db.put({{#camelCase}}{{{model}}}{{/camelCase}}.id, {{#camelCase}}{{{model}}}{{/camelCase}}.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(List<{{#pascalCase}}{{{model}}}{{/pascalCase}}> {{#camelCase}}{{{model}}}{{/camelCase}}s) async {
    try {
      final entries = {{#camelCase}}{{{model}}}{{/camelCase}}s.asMap().map(
        (index, {{#camelCase}}{{{model}}}{{/camelCase}}) => MapEntry(
          {{#camelCase}}{{{model}}}{{/camelCase}}.id,
          {{#camelCase}}{{{model}}}{{/camelCase}}.toJson(),
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
  Future<Stream<StreamResult<{{#pascalCase}}{{{model}}}{{/pascalCase}}>>> watchAll() async {
    final db = await cache();

    final stream = db.watch();

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
    final db = await cache();

    final stream = db.watch(key: id);

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
