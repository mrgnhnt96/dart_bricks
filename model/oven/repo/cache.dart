import 'package:_PROJECT_SNAKE_domain/models/_NAME_SNAKE.dart';
import 'package:_PROJECT_SNAKE_domain/models/request_result.dart';

abstract class I_NAME_PASCALsCache {
  const I_NAME_PASCALsCache();

  Future<RequestResult<List<_NAME_PASCAL>>> all();

  Future<RequestResult<_NAME_PASCAL>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save(_NAME_PASCAL _NAME_CAMEL);

  Future<RequestResult<void>> saveAll(List<_NAME_PASCAL> _NAME_CAMELs);

  Future<Stream<StreamResult<_NAME_PASCAL>>> watchAll();

  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id);
}
