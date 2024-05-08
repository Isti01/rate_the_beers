import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rate_the_beers/bloc/beer/beer_bloc.dart';
import 'package:rate_the_beers/components/beer_app_filled_button.dart';
import 'package:rate_the_beers/l10n/app_localizations.g.dart';
import 'package:rate_the_beers/pages/beer_list/beer_list_tile.dart';
import 'package:rate_the_beers/theme/app_theme.dart';

class BeerList extends StatelessWidget {
  final BeerState state;

  const BeerList({required this.state, super.key});

  @override
  Widget build(BuildContext context) {
    final beers = state.beers;
    return SliverList.separated(
      itemBuilder: (context, i) {
        if (i == beers.length) {
          return _buildTrailingElement(context);
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: BeerListTile(key: ValueKey(beers[i].id), beer: beers[i]),
          );
        }
      },
      separatorBuilder: (BuildContext context, int i) => i != beers.length - 1
          ? const Divider(
              color: kDividerColor,
              thickness: 1,
              height: 48,
            )
          : const SizedBox(),
      itemCount: beers.length + 1,
    );
  }

  Widget _buildTrailingElement(BuildContext context) {
    if (state.hasError) {
      final localizations = AppLocalizations.of(context);
      return Padding(
        padding: const EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 24,
          top: 32,
        ),
        child: Center(
          child: Column(
            children: [
              Text(
                localizations.failedToLoadMoreMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: BeerAppFilledButton(
                  large: true,
                  onPressed: () => context.read<BeerBloc>().retryLoading(),
                  child: Text(localizations.tryAgainCallToAction),
                ),
              )
            ],
          ),
        ),
      );
    }
    if (state.isLoading) {
      return const Padding(
        padding: EdgeInsets.only(
          left: 40,
          right: 40,
          bottom: 24,
          top: 32,
        ),
        child: Center(child: CircularProgressIndicator(color: Colors.black)),
      );
    }
    if (!state.hasReachedEnd) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) context.read<BeerBloc>().loadMore();
      });
    }
    return const SizedBox(height: 32);
  }
}
