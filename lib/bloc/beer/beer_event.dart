part of 'beer_bloc.dart';

@freezed
class BeerEvent with _$BeerEvent {
  const factory BeerEvent.loadMore() = _LoadMoreBeerEvent;

  const factory BeerEvent.error() = _ErrorBeerEvent;

  const factory BeerEvent.onData({
    required List<Beer> beers,
  }) = _OnDataBeerEvent;

  const factory BeerEvent.setFilter({
    required String? filter,
  }) = _SetFilterBeerEvent;
}
