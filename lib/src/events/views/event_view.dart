import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:noticeboard/src/events/components/event_list.dart';
import 'package:noticeboard/src/events/models/event_model.dart';

Future<List<Event>> fetchEvents() async {
  final String jsonString =
      await rootBundle.loadString('lib/src/events/data/event_data.json');

  return compute(parseEvents, jsonString);
}

List<Event> parseEvents(String jsonString) {
  final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();

  return parsed.map<Event>((json) => Event.fromJson(json)).toList();
}

class EventsView extends StatelessWidget {
  EventsView({Key? key, this.events}) : super(key: key);

  final List<Event>? events;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 1.0),
        child: FutureBuilder<List<Event>>(
          future: fetchEvents(),
          builder: (context, snapshot) {
            if (snapshot.hasError) print(snapshot.error);

            return snapshot.hasData
                ? EventList(events: snapshot.data)
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
