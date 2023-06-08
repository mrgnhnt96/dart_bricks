import 'dart:developer';

import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_data/utils/firestore.dart';

class _NAME_PASCALsSource extends Firestore implements I_NAME_PASCALsSource {
  const _NAME_PASCALsSource() : super('_NAME_SNAKEs');

  @override
  Future<RequestResult<List<_NAME_PASCAL>>> all() async {
    final _NAME_CAMELs = <_NAME_PASCAL>[];

    final snapshot = await collection.get();

    for (final doc in snapshot.docs) {
      final json = doc.data() as Map?;

      if (json == null) {
        continue;
      }

      json['id'] = doc.id;

      try {
        final _NAME_CAMEL =
            _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

        _NAME_CAMELs.add(_NAME_CAMEL);
      } catch (e) {
        log('$e');
      }
    }

    return RequestResult.success(_NAME_CAMELs);
  }

  @override
  Future<RequestResult<_NAME_PASCAL>> byId(String id) async {
    final snapshot = await collection.doc(id).get();

    final json = snapshot.data() as Map?;

    if (json == null) {
      return const RequestResult.failure('_NAME_SENTENCE not found');
    }

    json['id'] = snapshot.id;

    try {
      final _NAME_CAMEL =
          _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

      return RequestResult.success(_NAME_CAMEL);
    } catch (e) {
      log('$e');

      return const RequestResult.failure('_NAME_SENTENCE not found');
    }
  }

  @override
  Future<RequestResult<_NAME_PASCAL>> create() async {
    final new_NAME_PASCAL = _NAME_PASCAL.create();

    try {
      final doc = collection.doc();

      final json = new_NAME_PASCAL.toJson();

      json['id'] = doc.id;

      await doc.set(json);

      return RequestResult.success(_NAME_PASCAL.fromJson(json));
    } catch (e) {
      return RequestResult.failure(e.toString());
    }
  }

  @override
  Future<RequestResult<void>> delete(String id) async {
    try {
      await collection.doc(id).delete();
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> update(_NAME_PASCAL _NAME_CAMEL) async {
    try {
      await collection.doc(_NAME_CAMEL.id).set(_NAME_CAMEL.toJson());
    } catch (e) {
      return RequestResult.failure(e.toString());
    }

    return const RequestResult.success(null);
  }

  @override
  Future<RequestResult<void>> updateMany(
    List<_NAME_PASCAL> _NAME_CAMELs,
  ) async {
    try {
      var batch = newBatch();

      var count = 0;
      for (final _NAME_CAMEL in _NAME_CAMELs) {
        batch.set(collection.doc(_NAME_CAMEL.id), _NAME_CAMEL.toJson());

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

  @override
  Future<Stream<List<StreamResult<_NAME_PASCAL>>>> watchAll() async {
    try {
      final stream = collection.snapshots();

      return stream.map((snapshot) {
        final changes = <StreamResult<_NAME_PASCAL>>[];

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
            final _NAME_CAMEL =
                _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

            changes.add(StreamResult(_NAME_CAMEL, key: _NAME_CAMEL.id));
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

  @override
  Future<Stream<StreamResult<_NAME_PASCAL>>> watchById(String id) async {
    try {
      final stream = collection.doc(id).snapshots();

      return stream.map((snapshot) {
        final json = snapshot.data() as Map?;

        if (json == null) {
          return const StreamResult.failure('_NAME_SENTENCE not found');
        }

        json['id'] = snapshot.id;

        try {
          final _NAME_CAMEL =
              _NAME_PASCAL.fromJson(Map<String, dynamic>.from(json));

          return StreamResult(_NAME_CAMEL, key: _NAME_CAMEL.id);
        } catch (e) {
          log('$e');

          return const StreamResult.failure('_NAME_SENTENCE not found');
        }
      });
    } catch (e) {
      return Stream.value(StreamResult.failure(e.toString()));
    }
  }
}
