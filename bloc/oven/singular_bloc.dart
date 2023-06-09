import 'dart:async';

import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as con;
import 'package:equatable/equatable.dart';
import 'package:_PROJECT_SNAKE_application/utils/bloc_extensions.dart';
import 'package:_PROJECT_SNAKE_domain/domain.dart';

import 'package:_PROJECT_SNAKE_application/utils/persist_bloc.dart';

part '_SINGULAR_snake_bloc.g.dart';
part '_SINGULAR_snake_event.dart';
part '_SINGULAR_snake_state.dart';

// ignore: avoid_private_typedef_functions
typedef _Emitter = Emitter<_SINGULAR_PASCALState>;

class _SINGULAR_PASCALBloc
    extends PersistBloc<_SINGULAR_PASCALEvent, _SINGULAR_PASCALState> {
  _SINGULAR_PASCALBloc({
    required I_INTERFACE_PASCALCache _INTERFACE_CAMELCache,
    required I_INTERFACE_PASCALSource _INTERFACE_CAMELSource,
  })  : __INTERFACE_CAMELCache = _INTERFACE_CAMELCache,
        __INTERFACE_CAMELSource = _INTERFACE_CAMELSource,
        super(const _Loading()) {
    on<_Init>(_init, transformer: con.droppable());
    on<_Fetch>(_fetch, transformer: con.droppable());
    on<_Create>(_create, transformer: con.droppable());
    on<_Save>(_save, transformer: con.droppable());
    on<_Delete>(_delete, transformer: con.droppable());
    on<_CacheChanged>(_cacheChanged);
    on<_SourceChanged>(_sourceChanged);
  }

  final I_INTERFACE_PASCALCache __INTERFACE_CAMELCache;
  final I_INTERFACE_PASCALSource __INTERFACE_CAMELSource;

  late String __SINGULAR_CAMELId;
  bool _isCreating = false;

  StreamSubscription<StreamResult<_SINGULAR_PASCAL>>? _listener;

  @override
  Future<void> close() async {
    await _listener?.cancel();

    await super.close();
  }

  @override
  Future<Stream<_SINGULAR_PASCALState?>> listenForStorageChanges() async {
    final result = await __INTERFACE_CAMELCache.watchById(__SINGULAR_CAMELId);

    return result.asyncMap((event) {
      if (!state.isReady) {
        return null;
      }

      if (event.isFailure) {
        return null;
      }

      if (event.wasDeleted) {
        return null;
      }

      final _SINGULAR_CAMEL = event.value;

      if (_SINGULAR_CAMEL == null) {
        return null;
      }

      return _Ready(_SINGULAR_CAMEL);
    });
  }

  @override
  void onStorageChanged(_SINGULAR_PASCALState state) {
    if (state.isReady) {
      add(_CacheChanged(state.asReady));
    }
  }

  @override
  Future<void> persist(_SINGULAR_PASCALState state) async {
    if (!state.isReady || _isCreating) {
      return;
    }

    final result =
        await __INTERFACE_CAMELCache.byId(state.asReady._SINGULAR_CAMEL.id);

    if (result.isSuccess && result.value == state.asReady._SINGULAR_CAMEL) {
      return;
    }

    await __INTERFACE_CAMELCache.save(state.asReady._SINGULAR_CAMEL);
  }

  @override
  Future<_SINGULAR_PASCALState?> retrieve() async {
    final result = await __INTERFACE_CAMELCache.byId(__SINGULAR_CAMELId);

    if (result.isError) {
      return null;
    }

    return _Ready(result.value);
  }

  FutureOr<void> _cacheChanged(_CacheChanged event, _Emitter emit) async {
    emitNoCache(emit, event.state);
  }

  FutureOr<void> _create(_Create event, _Emitter emit) async {
    _isCreating = true;
    final result = await __INTERFACE_CAMELSource.create();

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    __SINGULAR_CAMELId = result.value.id;

    emit(_Ready(result.value));
  }

  FutureOr<void> _delete(_Delete event, _Emitter emit) async {
    emit(const _Saving());

    await __INTERFACE_CAMELCache.delete(__SINGULAR_CAMELId);

    final result = await __INTERFACE_CAMELSource.delete(__SINGULAR_CAMELId);

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    emit(const _Deleted());
  }

  Future<void> _fetch(_Fetch event, _Emitter emit) async {
    await _getData(emit);
  }

  Future<void> _getData(_Emitter emit) async {
    final result = await __INTERFACE_CAMELSource.byId(__SINGULAR_CAMELId);

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    emit(_Ready(result.value));

    await _listenToSourceChanges();
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    __SINGULAR_CAMELId = event.id;

    await hydrate(emit);

    await _getData(emit);
  }

  Future<void> _listenToSourceChanges() async {
    final stream = await __INTERFACE_CAMELSource.watchById(__SINGULAR_CAMELId);

    await _listener?.cancel();

    _listener = stream.listen((event) {
      if (event.wasDeleted) {
        add(const _SourceChanged(_Error('_NAME_SENTENCE was deleted')));
        return;
      }

      final _SINGULAR_CAMEL = event.value;

      if (_SINGULAR_CAMEL == null) {
        return;
      }

      final newState = _Ready(_SINGULAR_CAMEL);

      if (newState == state) {
        return;
      }

      add(_SourceChanged(newState));
    });
  }

  FutureOr<void> _save(_Save event, _Emitter emit) async {
    _isCreating = false;

    emit(const _Saving());

    final result = await __INTERFACE_CAMELSource.update(event._SINGULAR_CAMEL);

    if (result.isError) {
      emitError(emit, _Error(result.error));
      return;
    }

    emit(_Ready(event._SINGULAR_CAMEL));
  }

  FutureOr<void> _sourceChanged(_SourceChanged event, _Emitter emit) async {
    await stopListeningToChanges();

    emit(event.state);
  }
}
