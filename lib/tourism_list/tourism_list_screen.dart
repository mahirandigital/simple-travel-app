import 'package:flutter/material.dart';
import 'package:travel/models/tourism_place_model.dart';

class TourismListPage extends StatelessWidget {
  final String country;

  TourismListPage({super.key, required this.country});

  final List<TourismPlaceModel> tourismPlaces = [
    TourismPlaceModel(
      country: "Malaysia",
      namePlace: "Petronas Twin Towers",
      imageUrl:
          "https://images.pexels.com/photos/67559/kuala-lumpur-petronas-twin-towers-malaysia-klcc-67559.jpeg?auto=compress&cs=tinysrgb&w=600",
    ),
    TourismPlaceModel(
      country: "Malaysia",
      namePlace: "Langkawi Island",
      imageUrl:
          "https://media.istockphoto.com/id/989296550/photo/sunset-at-eagle-square-dataran-lang-is-one-of-langkawis-best-known-man-made-attractions-a.jpg?b=1&s=612x612&w=0&k=20&c=EYCIlejwDiZzvZel8CqboOqQwLe2hpFmbczSn0C_DHY=",
    ),
    TourismPlaceModel(
      country: "Malta",
      namePlace: "Valletta",
      imageUrl: "https://example.com/valletta.jpg",
    ),
    TourismPlaceModel(
      country: "Malta",
      namePlace: "Blue Lagoon",
      imageUrl: "https://example.com/bluelagoon.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPlaces =
        tourismPlaces.where((place) => place.country == country).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("$country - Tourism Places"),
      ),
      body: ListView.builder(
        itemCount: filteredPlaces.length,
        itemBuilder: (context, index) {
          final place = filteredPlaces[index];
          return Card(
            child: ListTile(
              leading: Image.network(
                place.imageUrl!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(place.namePlace!),
            ),
          );
        },
      ),
    );
  }
}
