import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_data/utils/database.dart';
import 'package:_PROJECT_SNAKE_data/utils/hive_cache.dart';

// ignore: strict_raw_type
class _INTERFACE_PASCALCache extends HiveCache
    implements I_INTERFACE_PASCALCache {
  _INTERFACE_PASCALCache() : super(Database._INTERFACE_CAMEL);

  @override
  Future<RequestResult<List<_SINGULAR_PASCAL>>> all() async {
    final _PLURAL_CAMEL = <_SINGULAR_PASCAL>[];

    final db = await cache();

    for (var i = 0; i < db.length; i++) {
      try {
        final value = db.values.elementAt(i);

        _PLURAL_CAMEL.add(
          _SINGULAR_PASCAL.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await db.deleteAt(i);
      }
    }

    return RequestResult.success(_PLURAL_CAMEL);
  }

  @override
  Future<RequestResult<_SINGULAR_PASCAL>> byId(String id) async {
    final db = await cache();

    final value = db.get(id);

    if (value == null) {
      return const RequestResult.failure('_SINGULAR_PASCAL not found');
    }

    try {
      return RequestResult.success(
        _SINGULAR_PASCAL.fromJson(
          Map<String, dynamic>.from(value),
        ),
      );
    } catch (_) {
      await db.delete(id);

      return const RequestResult.failure('_SINGULAR_PASCAL not found');
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
  Future<RequestResult<void>> save(_SINGULAR_PASCAL _SINGULAR_CAMEL) async {
    try {
      final db = await cache();

      await db.put(_SINGULAR_CAMEL.id, _SINGULAR_CAMEL.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(
    List<_SINGULAR_PASCAL> _PLURAL_CAMEL,
  ) async {
    try {
      final entries = _PLURAL_CAMEL.asMap().map(
            (index, _SINGULAR_CAMEL) => MapEntry(
              _SINGULAR_CAMEL.id,
              _SINGULAR_CAMEL.toJson(),
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
  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchAll() async {
    final db = await cache();

    final stream = db.watch();

    return stream.asyncMap<StreamResult<_SINGULAR_PASCAL>>(
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
            _SINGULAR_PASCAL.fromJson(
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
  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchById(String id) async {
    final db = await cache();

    final stream = db.watch(key: id);

    return stream.asyncMap<StreamResult<_SINGULAR_PASCAL>>(
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
            _SINGULAR_PASCAL.fromJson(
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
