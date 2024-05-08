part of 'beer_bloc.dart';

@freezed
class BeerState with _$BeerState {
  const factory BeerState.list({
    @Default(null) String? filter,
    @Default(1) int currentPage,
    @Default([]) List<Beer> beers,
  }) = _BeerState;

  const factory BeerState.error({
    @Default(null) String? filter,
    @Default(1) int currentPage,
    @Default([]) List<Beer> beers,
  }) = _ErrorBeerState;

  const factory BeerState.loading({
    @Default(null) String? filter,
    @Default(1) int currentPage,
    @Default([]) List<Beer> beers,
  }) = _LoadingBeerState;

  const factory BeerState.reachedEnd({
    @Default(null) String? filter,
    @Default(1) int currentPage,
    @Default([]) List<Beer> beers,
  }) = _ReachedEndBeerState;
}

extension BeerStateExtension on BeerState {
  bool get hasError => this is _ErrorBeerState;

  bool get isLoading => this is _LoadingBeerState;

  bool get hasReachedEnd => this is _ReachedEndBeerState;
}
