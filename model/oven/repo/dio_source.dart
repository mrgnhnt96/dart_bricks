import 'package:internal_domain/models/_NAME_SNAKE.dart';
import 'package:internal_domain/models/request_result.dart';

abstract class I_NAME_PASCALSource {
  const I_NAME_PASCALsCache();

  Future<RequestResult<List<_NAME_PASCAL>>> all();

  Future<RequestResult<_NAME_PASCAL>> byId(String id);

  Future<RequestResult<void>> delete(String id);

  Future<RequestResult<void>> update(_NAME_PASCAL _NAME_CAMEL);
}