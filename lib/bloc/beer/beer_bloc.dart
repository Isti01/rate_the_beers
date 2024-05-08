import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rate_the_beers/model/beer.dart';
import 'package:rate_the_beers/repository/beer_repository.dart';

part 'beer_bloc.freezed.dart';
part 'beer_event.dart';
part 'beer_state.dart';

class BeerBloc extends Bloc<BeerEvent, BeerState> {
  final BeerRepository beerRepository;

  BeerBloc({required this.beerRepository}) : super(const BeerState.loading()) {
    on<_LoadMoreBeerEvent>((event, emit) {
      emit(BeerState.loading(
        filter: state.filter,
        beers: state.beers,
        currentPage: state.currentPage + 1,
      ));
      _fetchCurrentPage();
    });

    on<_SetFilterBeerEvent>((event, emit) {
      if (event.filter == state.filter) {
        return;
      }

      emit(BeerState.loading(filter: event.filter));
      _fetchCurrentPage();
    });

    on<_OnDataBeerEvent>((event, emit) {
      if (event.beers.isEmpty) {
        emit(BeerState.reachedEnd(
          currentPage: state.currentPage,
          beers: state.beers,
          filter: state.filter,
        ));
        return;
      }
      emit(BeerState.list(
        currentPage: state.currentPage,
        beers: [...state.beers, ...event.beers],
        filter: state.filter,
      ));
    });

    on<_ErrorBeerEvent>((event, emit) {
      emit(BeerState.error(
        currentPage: state.currentPage,
        beers: state.beers,
        filter: state.filter,
      ));
    });

    _fetchCurrentPage();
  }

  void loadMore() {
    if (state.isLoading || state.hasError || state.hasReachedEnd) {
      return;
    }
    add(const BeerEvent.loadMore());
  }

  void _fetchCurrentPage() async {
    final pageToFetch = state.currentPage;
    return beerRepository
        .fetchBeers(page: pageToFetch)
        .then((beers) => BeerEvent.onData(beers: beers))
        .then(add)
        .onError((error, stackTrace) {
      log(
        'Failed to fetch beer page $pageToFetch',
        name: runtimeType.toString(),
        error: error,
        stackTrace: stackTrace,
      );
      add(const BeerEvent.error());
    });
  }
}
