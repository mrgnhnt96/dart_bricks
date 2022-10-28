import 'package:autoequal/autoequal.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// start_JSON_
import 'package:json_annotation/json_annotation.dart';
// end_JSON_

part '_NAME_snake_bloc.g.dart';
part '_NAME_snake_event.dart';
part '_NAME_snake_state.dart';

typedef _Emitter = Emitter<_NAME_pascalState>;

class _NAME_pascalBloc extends Bloc<_NAME_pascalEvent, _NAME_pascalState> {
  _NAME_pascalBloc() : super(const _Loading()) {
    on<_Init>(_init);

    add(const _Init());
  }

  Future<void> _init(_Init event, _Emitter emit) async {
    // TODO: implement _init
    throw UnimplementedError('_init() has not been implemented.');
  }

// start_JSON_
  _NAME_pascalState? fromJson(Map<String, dynamic>? json) {
    if (json != null) {
      return _Ready.fromJson(json);
    }

    return null;
  }

  Map<String, dynamic>? toJson(_NAME_pascalState state) {
    if (state.isReady) {
      return state.asReady.toJson();
    }

    return null;
  }
  // end_JSON_
}
