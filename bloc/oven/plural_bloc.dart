import 'dart:async';

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';
import 'package:_PROJECT_SNAKE_application/utils/bloc_extensions.dart';
import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_application/utils/persist_bloc.dart';

part '_PLURAL_snake_bloc.g.dart';
part '_PLURAL_snake_event.dart';
part '_PLURAL_snake_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<_PLURAL_PASCALState>;

class _PLURAL_PASCALBloc
    extends PersistBloc<_PLURAL_PASCALEvent, _PLURAL_PASCALState> {
  _PLURAL_PASCALBloc({
    required I_INTERFACE_PASCALCache _INTERFACE_CAMELCache,
    required I_INTERFACE_PASCALSource _INTERFACE_CAMELSource,
  })  : __INTERFACE_CAMELCache = _INTERFACE_CAMELCache,
        __INTERFACE_CAMELSource = _INTERFACE_CAMELSource,
        super(const _Loading()) {
    on<_Init>(_init);
    on<_Fetch>(_fetch, transformer: con.droppable());
    on<_CacheChanged>(_cacheChanged);
    on<_SourceChanged>(_sourceChanged);

    add(const _Init());
  }

  final I_INTERFACE_PASCALCache __INTERFACE_CAMELCache;
  final I_INTERFACE_PASCALSource __INTERFACE_CAMELSource;

  StreamSubscription<List<StreamResult<_SINGULAR_PASCAL>>>? _sourceListener;

  @override
  Future<void> close() {
    _sourceListener?.cancel();
    return super.close();
  }

  @override
  Future<Stream<_PLURAL_PASCALState?>> listenForStorageChanges() async {
    final result = await __INTERFACE_CAMELCache.watchAll();

    return result.asyncMap((event) {
      if (!state.isReady) {
        return null;
      }

      if (event.isFailure) {
        return null;
      }

      final _PLURAL_CAMEL = [...state.asReady._PLURAL_CAMEL];

      if (event.wasDeleted) {
        _PLURAL_CAMEL.removeWhere((e) => e.id == event.key);
      } else {
        final value = event.value;

        if (value == null) {
          return null;
        }

        final index = _PLURAL_CAMEL.indexWhere((e) => e.id == event.key);

        if (index == -1) {
          _PLURAL_CAMEL.add(value);
        } else {
          _PLURAL_CAMEL[index] = value;
        }
      }

      return _Ready(_PLURAL_CAMEL);
    });
  }

  @override
  void onStorageChanged(_PLURAL_PASCALState state) {
    if (state.isReady) {
      add(_CacheChanged(state.asReady));
    }
  }

  @override
  Future<void> persist(_PLURAL_PASCALState state) async {
    if (!state.isReady) {
      return;
    }

    final result = await __INTERFACE_CAMELCache.all();

    if (result.isError) {
      return;
    }

    final all = result.value;

    final ids = state.asReady._PLURAL_CAMEL.map((e) => e.id).toSet();

    final toDelete = all.fold(<String>{}, (previous, e) {
      if (!ids.contains(e.id)) {
        previous.add(e.id);
      }

      return previous;
    });

    if (toDelete.isNotEmpty) {
      await __INTERFACE_CAMELCache.deleteAll(toDelete);
    }

    final toUpdate = <_SINGULAR_PASCAL>[];

    // check if any all have changed from state.asReady.all
    for (final e in state.asReady._PLURAL_CAMEL) {
      if (!all.contains(e)) {
        toUpdate.add(e);
      }
    }

    if (toUpdate.isNotEmpty) {
      await __INTERFACE_CAMELCache.saveAll(toUpdate);
    }
  }

  @override
  Future<_PLURAL_PASCALState?> retrieve() async {
    final result = await __INTERFACE_CAMELCache.all();

    if (result.isError) {
      return null;
    }

    return _Ready(result.value);
  }

  FutureOr<void> _cacheChanged(_CacheChanged event, _Emitter emit) async {
    emitNoCache(emit, event.state);
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    emit(const _Loading());

    await _get_PLURAL_PASCAL(emit);
  }

  Future<void> _get_PLURAL_PASCAL(_Emitter emit) async {
    final result = await __INTERFACE_CAMELSource.all();

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    emit(_Ready(result.value));
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    await hydrate(emit);

    await _get_PLURAL_PASCAL(emit);

    final stream = await __INTERFACE_CAMELSource.watchAll();

    _sourceListener = stream.listen((changes) {
      if (!state.isReady) {
        return;
      }

      if (isClosed) {
        return;
      }

      final _PLURAL_CAMELById = state.asReady._PLURAL_CAMEL
          .asMap()
          .map((_, value) => MapEntry(value.id, value));

      for (final change in changes) {
        if (change.wasDeleted) {
          _PLURAL_CAMELById.remove(change.key);
        } else {
          _PLURAL_CAMELById[change.key] = change.value!;
        }
      }

      final newState = _Ready(_PLURAL_CAMELById.values.toList());

      if (state == newState) {
        return;
      }

      add(_SourceChanged(newState));
    });
  }

  FutureOr<void> _sourceChanged(_SourceChanged event, _Emitter emit) async {
    emit(event.state);
  }
}
