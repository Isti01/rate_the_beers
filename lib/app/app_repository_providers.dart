import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/repository/beer_repository.dart';

class AppRepositoryProviders extends StatelessWidget {
  final Widget child;

  const AppRepositoryProviders({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BeerRepository>(create: (_) => BeerApiRepository()),
      ],
      child: child,
    );
  }
}
