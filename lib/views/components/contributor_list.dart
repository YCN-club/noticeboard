import 'package:flutter/material.dart';

class ContributorsList extends StatelessWidget {
  const ContributorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100, (index) {
          return Card(
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        }),
      ),
    );
  }
}
