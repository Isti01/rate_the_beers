import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/bloc/beer/beer_bloc.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/theme/app_theme.dart';
import 'package:rxdart/rxdart.dart';

class BeerListSearchBar extends StatefulWidget {
  const BeerListSearchBar({super.key});

  @override
  State<BeerListSearchBar> createState() => _BeerListSearchBarState();
}

class _BeerListSearchBarState extends State<BeerListSearchBar> {
  final BehaviorSubject<String> _filterSubject = BehaviorSubject();
  late final TextEditingController _controller;
  late final StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    final filter = context.read<BeerBloc>().state.filter;
    _controller = TextEditingController(text: filter);

    _subscription = _filterSubject
        .debounceTime(const Duration(milliseconds: 500))
        .listen((filter) {
      if (!mounted) {
        return;
      }
      context.read<BeerBloc>().updateFilter(filter);
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = MaterialStatePropertyAll(
      TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w500,
        letterSpacing: 0,
      ),
    );
    final localizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 28),
      child: SearchBar(
        controller: _controller,
        hintText: localizations.searchHintText,
        textStyle: textStyle,
        hintStyle: textStyle,
        trailing: [
          Transform.flip(
            flipX: true,
            child: const Icon(Icons.search, size: 28, color: kIconColor),
          )
        ],
        padding: const MaterialStatePropertyAll(
          EdgeInsets.only(right: 24, left: 12),
        ),
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        elevation: const MaterialStatePropertyAll(0),
        side: MaterialStatePropertyAll(
          BorderSide(color: Colors.black.withOpacity(.6), width: 2),
        ),
        onChanged: _filterSubject.add,
      ),
    );
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
