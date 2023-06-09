import 'dart:developer';

import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:data/util/util.dart';

class _INTERFACE_pascalSource implements I_INTERFACE_pascalSource {
  const _INTERFACE_pascalSource();
// section_ALL_
  @override
  Future<RequestResult<List<_SINGULAR_pascal>>> all() async {
    try {
      final _PLURAL_camel = <_SINGULAR_pascal>[];

      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _PLURAL_camelJson = List<Map>.from(data as List);

      for (final _SINGULAR_camelJson in _PLURAL_camelJson) {
        try {
          _PLURAL_camel.add(
            _SINGULAR_pascal.fromJson(
              Map<String, dynamic>.from(_SINGULAR_camelJson),
            ),
          );
        } catch (e) {
          log('Error parsing _SINGULAR_camel, $e | $_SINGULAR_camelJson');
        }
      }

      return RequestResult.success(_PLURAL_camel);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  // endSection_ALL_
  // section_BY_ID_
  @override
  Future<RequestResult<_SINGULAR_pascal>> byId(String id) async {
    try {
      final result = await dio.get<Map>('${dio.url}/NOT_IMPLEMENTED/$id');

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _SINGULAR_camelJson = Map<String, dynamic>.from(data);

      return RequestResult.success(
        _SINGULAR_pascal.fromJson(_SINGULAR_camelJson),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  // endSection_BY_ID_
  // section_CREATE_
  @override
  Future<RequestResult<_SINGULAR_pascal>> create() async {
    try {
      final result = await dio.post<Map>(
        '${dio.url}/NOT_IMPLEMENTED',
        data: {},
      );

      final data = result.data;

      if (data == null) {
        return RequestResult.failure('No data');
      }

      final _SINGULAR_camelJson = Map<String, dynamic>.from(data);

      return RequestResult.success(
        _SINGULAR_pascal.fromJson(_SINGULAR_camelJson),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  // endSection_CREATE_
  // section_DELETE_
  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      await dio.delete<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
      );

      return const RequestResult.success(null);
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  // endSection_DELETE_
  // section_UPDATE_
  @override
  Future<RequestResult<void>> update(_SINGULAR_pascal _SINGULAR_camel) async {
    try {
      final id = _SINGULAR_camel.id;

      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED/$id',
        data: _SINGULAR_camel.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  // endSection_UPDATE_
  // section_UPDATE_MANY_
  @override
  Future<RequestResult<void>> updateMany(
      List<_SINGULAR_pascal> _PLURAL_camel) async {
    try {
      await dio.put<Map>(
        '${dio.url}/NOT_IMPLEMENTED',
        data: _PLURAL_camel.toJson(),
      );
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }
  // endSection_UPDATE_MANY_
}
