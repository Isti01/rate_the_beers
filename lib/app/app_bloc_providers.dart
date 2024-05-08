import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:rate_the_beers/bloc/beer/beer_bloc.dart';
import 'package:rate_the_beers/repository/beer_repository.dart';

class AppBlocProviders extends StatelessWidget {
  final Widget child;

  const AppBlocProviders({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ProxyProvider<BeerRepository, BeerBloc>(
          update: (_, repository, __) => BeerBloc(beerRepository: repository),
        )
      ],
      child: child,
    );
  }
}
