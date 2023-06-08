import 'package:_PROJECT_SNAKE_domain/models/_NAME_SNAKE.dart';
import 'package:_PROJECT_SNAKE_domain/models/request_result.dart';

abstract class I_NAME_PASCALsSource {
  const I_NAME_PASCALsSource();
// section_ALL_
  Future<RequestResult<List<_NAME_PASCAL>>> all();
// endSection_ALL_
// section_BY_ID_
  Future<RequestResult<_NAME_PASCAL>> byId(String id);
// endSection_BY_ID_
// section_CREATE_
  Future<RequestResult<_NAME_PASCAL>> create();
// endSection_CREATE_
  // section_DELETE_
  Future<RequestResult<void>> delete(String id);
  // endSection_DELETE_
  // section_UPDATE_
  Future<RequestResult<void>> update(_NAME_PASCAL _NAME_CAMEL);
  // endSection_UPDATE_
  // section_UPDATE_MANY_
  Future<RequestResult<void>> updateMany(List<_NAME_PASCAL> _NAME_CAMELs);
  // endSection_UPDATE_MANY_
  // section_WATCH_ALL_
  Future<Stream<List<StreamResult<_NAME_PASCAL>>>> watchAll();
  // endSection_WATCH_ALL_
  // section_WATCH_BY_ID_
  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id);
  // endSection_WATCH_BY_ID_
}
