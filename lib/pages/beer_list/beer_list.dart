import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/bloc/beer/beer_bloc.dart';

class BeerList extends StatelessWidget {
  final BeerState state;

  const BeerList({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final beers = state.beers;
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i == beers.length) {
          return _buildTrailingElement(context);
        } else {
          return Text(beers[i].name);
        }
      },
      itemCount: beers.length + 1,
    );
  }

  Widget _buildTrailingElement(BuildContext context) {
    if (state.hasError) {
      return const Text('Failed to Load More');
    }
    if (state.isLoading) {
      return const CircularProgressIndicator();
    }
    if (!state.hasReachedEnd) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.read<BeerBloc>().loadMore();
      });
    }
    return const SizedBox();
  }
}
