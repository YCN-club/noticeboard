import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:noticeboard/src/contributors/controllers/contributors_controller.dart';

class ContributorsView extends ConsumerWidget {
  const ContributorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final contributors = ref.watch(contributorsProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Contributors'),
      ),
      body: contributors.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index].avatarUrl),
              ),
              title: Text(
                data[index].login,
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                '${data[index].contributions.toString()} contributions',
                style: textTheme.bodySmall,
              ),
              trailing: IconButton.outlined(
                onPressed: () {
                  launchUrl(Uri.parse(data[index].htmlUrl));
                },
                icon: const Icon(Icons.arrow_outward),
              ),
            );
          }),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          print(error.toString());
          return Center(
            child: Text('Contributors could not be fetched.'),
          );
        },
      ),
    );
  }
}
