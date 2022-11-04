import 'package:data/util/util.dart';
import 'package:domain/domain.dart';
import '_NAME_snake_repos.dart';

class _Keys {
  const _Keys._();

  static const _NAME_camel = '_NAME_snake';
}

class _NAME_pascalCache extends HiveCache<Map> implements I_NAME_pascalCache {
  _NAME_pascalCache() : super(_Keys._NAME_camel, byUser: _BY_USER_);

  @override
  Future<RequestResult<List<_MODEL_pascal>>> all() async {
    await cacheInit();

    final _MODEL_camels = <_MODEL_pascal>[];

    for (var i = 0; i < cache.length; i++) {
      try {
        final value = cache.values.elementAt(i);

        _MODEL_camels.add(
          _MODEL_pascal.fromJson(
            Map<String, dynamic>.from(value),
          ),
        );
      } catch (_) {
        await cache.deleteAt(i);
      }
    }

    return RequestResult.success(_MODEL_camels);
  }

  @override
  Future<RequestResult<_MODEL_pascal>> byId(String id) async {
    await cacheInit();

    final value = cache.get(id);

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
      await cache.delete(id);

      return RequestResult.failure('_MODEL_pascal not found');
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
  Future<RequestResult<void>> save(_MODEL_pascal _MODEL_camel) async {
    await cacheInit();

    try {
      await cache.put(_MODEL_camel.id, _MODEL_camel.toJson());
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> saveAll(List<_MODEL_pascal> _MODEL_camels) async {
    await cacheInit();

    try {
      final entries = _MODEL_camels.asMap().map(
        (index, _MODEL_camel) => MapEntry(
          _MODEL_camel.id,
          _MODEL_camel.toJson(),
        ),
      );

      await cache.putAll(entries);
    } catch (e) {
      return RequestResult.failure('$e');
    }

    return const RequestResult.success(null);
  }

  @override
  Future<Stream<StreamResult<_MODEL_pascal>>> watchAll() async {
    await cacheInit();

    final stream = cache.watch();

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
    await cacheInit();

    final stream = cache.watch(key: id);

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
