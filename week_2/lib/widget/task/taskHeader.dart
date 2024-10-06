import 'package:flutter/material.dart';

class taskHeader extends StatelessWidget {
  const taskHeader({Key? key, required this.totalTask}) : super(key: key);

  final int totalTask;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity * 0.3,
      height: MediaQuery.of(context).size.height * 0.15,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 8, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total Task: $totalTask',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
