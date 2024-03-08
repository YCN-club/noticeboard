import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:noticeboard/src/contributors/controllers/contributors_controller.dart';

class ContributorsView extends ConsumerWidget {
  const ContributorsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contributors = ref.watch(contributorsProvider);

    return contributors.when(
        data: (data) => ListView.builder(
              itemCount: data.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  trailing: IconButton(
                    onPressed: () {
                      launchUrl(Uri.parse(data[index].htmlUrl));
                    },
                    icon: const Icon(Icons.open_in_new),
                  ),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(data[index].avatarUrl),
                  ),
                  title: Text(
                    data[index].login,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text(
                      '${data[index].contributions.toString()} contributions',
                      style: const TextStyle(color: Colors.grey)),
                );
              }),
            ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          print(stackTrace.toString());
          return Center(
            child: Text('Contributors could not be fetched.'),
          );
        });
  }
}
