import 'package:flutter/material.dart';

class BeerListSearchBar extends StatelessWidget {
  const BeerListSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 28),
      child: Text('Search Field'),
    );
  }
}
