import 'package:_PROJECT_SNAKE_domain/models/_SINGULAR_SNAKE.dart';
import 'package:_PROJECT_SNAKE_domain/models/request_result.dart';

abstract class I_INTERFACE_PASCALCache {
  const I_INTERFACE_PASCALCache();

  Future<RequestResult<List<_SINGULAR_PASCAL>>> all();

  Future<RequestResult<_SINGULAR_PASCAL>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> deleteAll([Set<String>? ids]);

  Future<RequestResult<void>> save(_SINGULAR_PASCAL _SINGULAR_CAMEL);

  Future<RequestResult<void>> saveAll(List<_SINGULAR_PASCAL> _PLURAL_CAMEL);

  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchAll();

  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchById(String id);
}
