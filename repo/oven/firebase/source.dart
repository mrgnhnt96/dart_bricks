import 'dart:developer';

import 'package:_PROJECT_SNAKE_data/utils/parsers.dart';
import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_data/utils/firestore.dart';

class _INTERFACE_PASCALSource extends Firestore
    implements I_INTERFACE_PASCALSource {
  const _INTERFACE_PASCALSource() : super('_INTERFACE_SNAKE');

  // section_ALL_
  @override
  Future<RequestResult<List<_SINGULAR_PASCAL>>> all() async {
    final _PLURAL_CAMEL = <_SINGULAR_PASCAL>[];

    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      final json = doc.data() as Map?;

      if (json == null) {
        continue;
      }

      json['id'] = doc.id;

      try {
        parseTimestamp(json);
        final _SINGULAR_CAMEL =
            _SINGULAR_PASCAL.fromJson(Map<String, dynamic>.from(json));

        _PLURAL_CAMEL.add(_SINGULAR_CAMEL);
      } catch (e) {
        log('$e');
      }
    }

    return RequestResult.success(_PLURAL_CAMEL);
  }

  // endSection_ALL_
  // section_BY_ID_
  @override
  Future<RequestResult<_SINGULAR_PASCAL>> byId(String id) async {
    final snapshot = await collection.doc(id).get();

    final json = snapshot.data() as Map?;

    if (json == null) {
      return const RequestResult.failure('_SINGULAR_SENTENCE not found');
    }

    json['id'] = snapshot.id;

    try {
      parseTimestamp(json);
      final _SINGULAR_CAMEL =
          _SINGULAR_PASCAL.fromJson(Map<String, dynamic>.from(json));

      return RequestResult.success(_SINGULAR_CAMEL);
    } catch (e) {
      log('$e');

      return const RequestResult.failure('_SINGULAR_SENTENCE not found');
    }
  }

  // endSection_BY_ID_
  // section_CREATE_
  @override
  Future<RequestResult<_SINGULAR_PASCAL>> create() async {
    final new_SINGULAR_PASCAL = _SINGULAR_PASCAL.create();

    try {
      final doc = collection.doc();

      final json = new_SINGULAR_PASCAL.toJson();

      json['id'] = doc.id;

      await doc.set(json);

      return RequestResult.success(_SINGULAR_PASCAL.fromJson(json));
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  // endSection_CREATE_
  // section_DELETE_
  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  // endSection_DELETE_
  // section_UPDATE_
  @override
  Future<RequestResult<void>> update(_SINGULAR_PASCAL _SINGULAR_CAMEL) async {
    try {
      await collection.doc(_SINGULAR_CAMEL.id).set(_SINGULAR_CAMEL.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  // endSection_UPDATE_
  // section_UPDATE_MANY_
  @override
  Future<RequestResult<void>> updateMany(
    List<_SINGULAR_PASCAL> _PLURAL_CAMEL,
  ) async {
    try {
      var batch = newBatch();

      var count = 0;
      for (final _SINGULAR_CAMEL in _PLURAL_CAMEL) {
        batch.set(collection.doc(_SINGULAR_CAMEL.id), _SINGULAR_CAMEL.toJson());

        count++;

        if (count == 500) {
          await batch.commit();

          batch = newBatch();

          count = 0;
        }
      }

      await batch.commit();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  // endSection_UPDATE_MANY_
  // section_WATCH_ALL_
  @override
  Future<Stream<List<StreamResult<_SINGULAR_PASCAL>>>> watchAll() async {
    try {
      final stream = collection.snapshots();

      return stream.map((snapshot) {
        final changes = <StreamResult<_SINGULAR_PASCAL>>[];

        for (final change in snapshot.docChanges) {
          if (change.type.isRemoved) {
            changes.add(StreamResult.deleted(change.doc.id));
            continue;
          }

          final doc = change.doc;
          final json = doc.data() as Map?;

          if (json == null) {
            continue;
          }

          json['id'] = doc.id;

          try {
            parseTimestamp(json);
            final _SINGULAR_CAMEL =
                _SINGULAR_PASCAL.fromJson(Map<String, dynamic>.from(json));

            changes.add(StreamResult(_SINGULAR_CAMEL, key: _SINGULAR_CAMEL.id));
          } catch (e) {
            log('$e');
          }
        }

        return changes;
      });
    } catch (e) {
      return Stream.value([StreamResult.failure(e.toString())]);
    }
  }

  // endSection_WATCH_ALL_
  // section_WATCH_BY_ID_
  @override
  Future<Stream<StreamResult<_SINGULAR_PASCAL>>> watchById(String id) async {
    try {
      final stream = collection.doc(id).snapshots();

      return stream.map((snapshot) {
        final json = snapshot.data() as Map?;

        if (json == null) {
          return const StreamResult.failure('_SINGULAR_SENTENCE not found');
        }

        json['id'] = snapshot.id;

        try {
          parseTimestamp(json);
          final _SINGULAR_CAMEL =
              _SINGULAR_PASCAL.fromJson(Map<String, dynamic>.from(json));

          return StreamResult(_SINGULAR_CAMEL, key: _SINGULAR_CAMEL.id);
        } catch (e) {
          log('$e');

          return const StreamResult.failure('_SINGULAR_SENTENCE not found');
        }
      });
    } catch (e) {
      return Stream.value(StreamResult.failure(e.toString()));
    }
  }
  // endSection_WATCH_BY_ID_
}
