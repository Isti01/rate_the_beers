import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/bloc/beer/beer_bloc.dart';
import 'package:rate_the_beers/pages/beer_list/beer_list.dart';
import 'package:rate_the_beers/pages/beer_list/beer_list_app_bar.dart';
import 'package:rate_the_beers/pages/beer_list/beer_list_search_bar.dart';

class BeerListPage extends StatelessWidget {
  const BeerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: BeerListAppBar()),
          const SliverToBoxAdapter(child: BeerListSearchBar()),
          SliverSafeArea(
            top: false,
            sliver: BlocBuilder<BeerBloc, BeerState>(
              builder: (context, state) => BeerList(state: state),
            ),
          )
        ],
      ),
    );
  }
}
