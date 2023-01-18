import 'package:data/repos/all_cache/all_cache_repo.dart';
import 'package:data/repos/all_cache/database.dart';
import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '_NAME_snake_repos.dart';

class _NAME_pascalCache extends HiveCache<Map>
    implements I_NAME_pascalCache, ICache {
  _NAME_pascalCache() : super(Database._NAME_camel);

  @override
  Future<RequestResult<List<_MODEL_pascal>>> all() async {
    final _MODEL_camels = <_MODEL_pascal>[];

    final db = await cache();

    for (var i = 0; i < db.length; i++) {
      try {
        final value = db.values.elementAt(i);

        _MODEL_camels.add(
          _MODEL_pascal.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await db.deleteAt(i);
      }
    }

    return RequestResult.success(_MODEL_camels);
  }

  @override
  Future<RequestResult<_MODEL_pascal>> byId(String id) async {
    final db = await cache();

    final value = db.get(id);

    if (value == null) {
      return RequestResult.failure('_MODEL_pascal not found');
    }

    try {
      return RequestResult.success(
        _MODEL_pascal.fromJson(
          Map<String, dynamic>.from(value),
        ),
      );
    } catch (_) {
      await db.delete(id);

      return RequestResult.failure('_MODEL_pascal not found');
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
  Future<RequestResult<void>> deleteAll() async {
    try {
      final db = await cache();

      await db.clear();
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> save(_MODEL_pascal _MODEL_camel) async {
    try {
      final db = await cache();

      await db.put(_MODEL_camel.id, _MODEL_camel.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(List<_MODEL_pascal> _MODEL_camels) async {
    try {
      final entries = _MODEL_camels.asMap().map(
        (index, _MODEL_camel) => MapEntry(
          _MODEL_camel.id,
          _MODEL_camel.toJson(),
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
  Future<Stream<StreamResult<_MODEL_pascal>>> watchAll() async {
    final db = await cache();

    final stream = db.watch();

    return stream.asyncMap<StreamResult<_MODEL_pascal>>(
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
            _MODEL_pascal.fromJson(
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
  Future<Stream<StreamResult<_MODEL_pascal>>> watchById(String id) async {
    final db = await cache();

    final stream = db.watch(key: id);

    return stream.asyncMap<StreamResult<_MODEL_pascal>>(
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
            _MODEL_pascal.fromJson(
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
