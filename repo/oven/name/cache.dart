import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_data/utils/database.dart';
import 'package:_PROJECT_SNAKE_data/utils/hive_cache.dart';

// ignore: strict_raw_type
class _NAME_PASCALsCache extends HiveCache implements I_NAME_PASCALsCache {
  _NAME_PASCALsCache() : super(Database._NAME_CAMELs);

  @override
  Future<RequestResult<List<_NAME_PASCAL>>> all() async {
    final _NAME_CAMELs = <_NAME_PASCAL>[];

    final db = await cache();

    for (var i = 0; i < db.length; i++) {
      try {
        final value = db.values.elementAt(i);

        _NAME_CAMELs.add(
          _NAME_PASCAL.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await db.deleteAt(i);
      }
    }

    return RequestResult.success(_NAME_CAMELs);
  }

  @override
  Future<RequestResult<_NAME_PASCAL>> byId(String id) async {
    final db = await cache();

    final value = db.get(id);

    if (value == null) {
      return const RequestResult.failure('_NAME_PASCAL not found');
    }

    try {
      return RequestResult.success(
        _NAME_PASCAL.fromJson(
          Map<String, dynamic>.from(value),
        ),
      );
    } catch (_) {
      await db.delete(id);

      return const RequestResult.failure('_NAME_PASCAL not found');
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
  Future<RequestResult<void>> save(_NAME_PASCAL _NAME_CAMEL) async {
    try {
      final db = await cache();

      await db.put(_NAME_CAMEL.id, _NAME_CAMEL.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(
    List<_NAME_PASCAL> _NAME_CAMELs,
  ) async {
    try {
      final entries = _NAME_CAMELs.asMap().map(
        (index, _NAME_CAMEL) => MapEntry(
          _NAME_CAMEL.id,
          _NAME_CAMEL.toJson(),
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
  Future<Stream<StreamResult<_NAME_PASCAL>>> watchAll() async {
    final db = await cache();

    final stream = db.watch();

    return stream.asyncMap<StreamResult<_NAME_PASCAL>>(
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
            _NAME_PASCAL.fromJson(
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
  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id) async {
    final db = await cache();

    final stream = db.watch(key: id);

    return stream.asyncMap<StreamResult<_NAME_PASCAL>>(
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
            _NAME_PASCAL.fromJson(
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
