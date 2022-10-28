import '../../util/util.dart';
import 'package:domain/domain.dart';
import '_NAME_snake_repos.dart';

class _NAME_pascalCache extends HiveCache<Map> implements I_NAME_pascalCache {
  const _NAME_pascalCache() : super('_NAME_snake', byUser: _BY_USER_);

  @override
  Future<RequestResult<List<_MODEL_pascal>>> all() async {
    await cacheInit();

    throw UnimplementedError('all() has not been implemented.');
  }

  @override
  Future<RequestResult<_MODEL_pascal>> byId(String id) async {
    await cacheInit();

    throw UnimplementedError('byId() has not been implemented.');
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    await cacheInit();

    throw UnimplementedError('delete() has not been implemented.');
  }

  @override
  Future<RequestResult<void>> deleteAll() async {
    await cacheInit();

    throw UnimplementedError('deleteAll() has not been implemented.');
  }

  @override
  Future<RequestResult<_MODEL_pascal>> save(_MODEL_pascal _MODEL_camel) async {
    await cacheInit();

    throw UnimplementedError('save() has not been implemented.');
  }

  @override
  Future<RequestResult<_MODEL_pascal>> saveAll(
      List<_MODEL_pascal> _MODEL_camels) async {
    await cacheInit();

    throw UnimplementedError('saveAll() has not been implemented.');
  }
}
