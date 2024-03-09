import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    required this.title,
    required this.description,
    required this.image,
  });

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10.0,
      child: Column(
        children: [
          FadeInImage.assetNetwork(
            placeholder: 'assets/placeholder.jpg',
            image: image,
          ),
          ListTile(
            title: Text(title),
            subtitle: Text(description),
          )
        ],
      ),
    );
  }
}
