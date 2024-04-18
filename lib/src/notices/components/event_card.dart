import 'package:flutter/material.dart';

import 'package:noticeboard/src/notices/models/event_model.dart';

class EventCard extends StatefulWidget {
  const EventCard({super.key, required this.event});

  final Event event;

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(0),
        child: InkWell(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.event.club),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        widget.event.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.alarm, size: 18.0),
                          ),
                          Text(widget.event.date),
                        ],
                      )
                    ],
                  ),
                ),
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.description,
                    size: 36.0,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
