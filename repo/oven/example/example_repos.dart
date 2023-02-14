import 'package:data/util/request_result.dart';
import 'package:domain/domain.dart';

abstract class I_NAME_pascalCache {
  Future<RequestResult<List<_MODEL_pascal>>> all();

  Future<RequestResult<_MODEL_pascal>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save(_MODEL_pascal _MODEL_camel);

  Future<RequestResult<void>> saveAll(List<_MODEL_pascal> _MODEL_camels);

  Future<Stream<StreamResult<_MODEL_pascal>>> watchAll();

  Future<Stream<StreamResult<_MODEL_pascal>>> watchById(String id);
}

abstract class I_NAME_pascalSource {
  Future<RequestResult<List<_MODEL_pascal>>> all();

  Future<RequestResult<_MODEL_pascal>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update(_MODEL_pascal _MODEL_camel);
}
