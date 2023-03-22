import 'package:internal_domain/models/_NAME_SNAKE.dart';
import 'package:internal_domain/models/request_result.dart';

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
