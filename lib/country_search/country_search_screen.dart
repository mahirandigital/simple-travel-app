import 'package:flutter/material.dart';
import 'package:travel/models/tourism_place_model.dart';
import 'package:travel/tourism_list/tourism_list_screen.dart';

// class MyWidget extends StatefulWidget {
//   const MyWidget({super.key});

//   @override
//   State<MyWidget> createState() => _MyWidgetState();
// }

// class _MyWidgetState extends State<MyWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class CountrySearchPage extends StatefulWidget {
  const CountrySearchPage({super.key});

  @override
  State<CountrySearchPage> createState() => _CountrySearchPageState();
}

class _CountrySearchPageState extends State<CountrySearchPage> {
  final List<TourismPlaceModel> tourismPlaceModels = [
    TourismPlaceModel(
      country: "Malaysia",
      namePlace: "Petronas Twin Towers",
      imageUrl: "https://example.com/petronas.jpg",
    ),
    TourismPlaceModel(
      country: "Malaysia",
      namePlace: "Langkawi Island",
      imageUrl: "https://example.com/langkawi.jpg",
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
    TourismPlaceModel(
      country: "Germany",
      namePlace: "Brandenburg Gate",
      imageUrl: "https://example.com/brandenburg.jpg",
    ),
    TourismPlaceModel(
      country: "France",
      namePlace: "Eiffel Tower",
      imageUrl: "https://example.com/eiffel.jpg",
    ),
  ];

  late List<String?> countries;
  String query = "";
  List<String?> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    // Extract unique country names from tourismPlaceModelTourismPlaceModels
    countries = tourismPlaceModels
        .map((place) => place.country)
        .toSet()
        .toList(); // Use a Set to ensure uniqueness
    filteredCountries = countries;
  }

  void searchCountry(String query) {
    final suggestions = countries
        .where(
            (country) => country!.toLowerCase().startsWith(query.toLowerCase()))
        .toList();

    setState(() {
      this.query = query;
      filteredCountries = suggestions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Search Country",
                border: OutlineInputBorder(),
              ),
              onChanged: searchCountry,
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  final country = filteredCountries[index];
                  return ListTile(
                    title: Text(country ?? ""),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              TourismListPage(country: country!),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
