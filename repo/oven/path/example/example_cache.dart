import '../../util/util.dart';
import 'package:domain/domain.dart';
import '_NAME_snake_repos.dart';

class _Keys {
  const _Keys._();

  static const _NAME_camel = '_NAME_snake';
}

class _NAME_pascalCache extends HiveCache<Map> implements I_NAME_pascalCache {
  const _NAME_pascalCache() : super(_Keys._NAME_camel, byUser: _BY_USER_);

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

    return _MODEL_camels;
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
  Future<RequestResult<_MODEL_pascal>> save(_MODEL_pascal _MODEL_camel) async {
    await cacheInit();

    try {
      await cache.put(_MODEL_camel.id, _MODEL_camel.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<_MODEL_pascal>> saveAll(
      List<_MODEL_pascal> _MODEL_camels) async {
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
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
}
