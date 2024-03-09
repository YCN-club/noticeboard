import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:noticeboard/src/notices/controllers/events_controller.dart';

class EventsView extends ConsumerWidget {
  const EventsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final events = ref.watch(eventsProvider);

    return events.when(
      data: (data) => ListView.builder(
        itemCount: data.result.length,
        itemBuilder: ((context, index) {
          return Card(
            color: colorScheme.background,
            shadowColor: colorScheme.shadow,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage.assetNetwork(
                      width: 150,
                      placeholder: 'assets/loading.gif',
                      image: data.result[index].imageUrl,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.result[index].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              letterSpacing: -0.6,
                              color: colorScheme.onBackground),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          data.result[index].shortDescription,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: colorScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) {
        print(stackTrace.toString());
        return Center(
          child: Text('Events could not be fetched.'),
        );
      },
    );
  }
}
