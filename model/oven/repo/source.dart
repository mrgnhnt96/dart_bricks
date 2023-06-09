import 'package:_PROJECT_SNAKE_domain/models/_SINGULAR_SNAKE.dart';
import 'package:_PROJECT_SNAKE_domain/models/request_result.dart';

abstract class I_INTERFACE_PASCALSource {
  const I_INTERFACE_PASCALSource();
// section_ALL_
  Future<RequestResult<List<_SINGULAR_PASCAL>>> all();
// endSection_ALL_
// section_BY_ID_
  Future<RequestResult<_SINGULAR_PASCAL>> byId(String id);
// endSection_BY_ID_
// section_CREATE_
  Future<RequestResult<_SINGULAR_PASCAL>> create();
// endSection_CREATE_
  // section_DELETE_
  Future<RequestResult<void>> delete(String id);
  // endSection_DELETE_
  // section_UPDATE_
  Future<RequestResult<void>> update(_SINGULAR_PASCAL _SINGULAR_CAMEL);
  // endSection_UPDATE_
  // section_UPDATE_MANY_
  Future<RequestResult<void>> updateMany(List<_SINGULAR_PASCAL> _PLURAL_CAMEL);
  // endSection_UPDATE_MANY_
  // section_WATCH_ALL_
  Future<Stream<List<StreamResult<_SINGULAR_PASCAL>>>> watchAll();
  // endSection_WATCH_ALL_
  // section_WATCH_BY_ID_
  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchById(String id);
  // endSection_WATCH_BY_ID_
}
