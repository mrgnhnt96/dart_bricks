import 'package:internal_domain/domain.dart';

import 'package:internal_data/utils/request_result.dart';

abstract class I_NAME_PASCALsCache {
  Future<RequestResult<List<_NAME_PASCAL>>> all();

  Future<RequestResult<_NAME_PASCAL>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save(_NAME_PASCAL _NAME_CAMEL);

  Future<RequestResult<void>> saveAll(List<_NAME_PASCAL> _NAME_CAMELs);

  Future<Stream<StreamResult<_NAME_PASCAL>>> watchAll();

  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id);
}

abstract class I_NAME_PASCALsSource {
  Future<RequestResult<List<_NAME_PASCAL>>> all();

  Future<RequestResult<_NAME_PASCAL>> byId(String id);

  Future<RequestResult<_NAME_PASCAL>> create();

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update(_NAME_PASCAL _NAME_CAMEL);

  Future<RequestResult<void>> updateMany(List<_NAME_PASCAL> _NAME_CAMELs);

  Future<Stream<List<StreamResult<_NAME_PASCAL>>>> watchAll();

  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id);
}
