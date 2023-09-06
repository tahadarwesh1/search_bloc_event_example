import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'search_event.dart';
part 'search_state.dart';
part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState.initial()) {
    log('SearchBloc created');
    on<SearchEvent>(
          (event, emit) => _search(emit, event.search),
      transformer: (eventsStream, mapper) => eventsStream
          .debounceTime(const Duration(seconds:1))
          .distinct()
          .switchMap(mapper),
    );
  }

  Future<void> _search(Emitter<SearchState> emit, String query) async {
    emit(const SearchState.loading());

    // Simulate an API call or any other search operation
    await Future.delayed(const Duration(seconds: 1));

    emit(SearchState.loaded(query));
  }
}
