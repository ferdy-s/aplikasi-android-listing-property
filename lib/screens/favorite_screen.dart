import 'package:flutter/material.dart';
import '../models/property.dart';
import '../widgets/property_card.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Property> favoriteProperties = [
    Property(
      title: "Giri Loka II",
      location: "BSD",
      price: "Rp 150 M",
      bedrooms: 2,
      bathrooms: 1,
      size: "150 m²",
      description: "Rumah 2 lantai minimalis modern.",
      images: ["assets/house1.jpeg"],
      features: ["Taman", "Garasi"],
      type: "Rumah",
    ),
    Property(
      title: "Citra Raya II",
      location: "Cikupa",
      price: "Rp 84 M",
      bedrooms: 3,
      bathrooms: 2,
      size: "170 m²",
      description: "Rumah modern dan strategis.",
      images: ["assets/house2.jpeg"],
      features: ["Parkir", "Keamanan 24 Jam"],
      type: "Rumah",
    ),
    Property(
      title: "KasuarI",
      location: "Serpong",
      price: "Rp 2.91 M",
      bedrooms: 4,
      bathrooms: 3,
      size: "240 m²",
      description: "Rumah mewah dekat stasiun.",
      images: ["assets/house3.jpeg"],
      features: ["Kolam Renang", "Garasi"],
      type: "Rumah",
    ),
    Property(
      title: "Natura Hills",
      location: "Ciputat",
      price: "Rp 960 JT",
      bedrooms: 2,
      bathrooms: 1,
      size: "90 m²",
      description: "Hunian nyaman untuk keluarga muda.",
      images: ["assets/house4.jpeg"],
      features: ["Taman", "Garasi"],
      type: "Rumah",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FD),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back_ios_new, size: 20),
                  ),
                  Spacer(),
                  Text(
                    "Favorit",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Color(0xFF1B0A46),
                    radius: 18,
                    child: Icon(Icons.favorite, color: Colors.white, size: 16),
                  ),
                ],
              ),
            ),

            // Grid daftar properti favorit
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: favoriteProperties.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16, // ✅ diperbaiki dari 116
                    crossAxisSpacing: 16,
                    childAspectRatio: 3 / 4.3, // ✅ proporsi ditinggikan untuk muat konten
                  ),
                  itemBuilder: (context, index) {
                    final property = favoriteProperties[index];
                    return PropertyCard(property: property);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
