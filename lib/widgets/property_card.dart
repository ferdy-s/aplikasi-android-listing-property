import 'package:flutter/material.dart';
import '../models/property.dart';
import '../screens/details_screen.dart';

class PropertyCard extends StatelessWidget {
  final Property property;

  const PropertyCard({Key? key, required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailsScreen(property: property)),
        );
      },
      child: Container(
        height: 285, // ✅ Disesuaikan untuk tampung button
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: Image.asset(
                property.images.first,
                height: 120, // ✅ Kurangi tinggi gambar agar space bawah cukup
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    property.location,
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.bed, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${property.bedrooms}', style: TextStyle(fontSize: 12)),
                      SizedBox(width: 8),
                      Icon(Icons.bathtub, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text('${property.bathrooms}', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        property.price,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => DetailsScreen(property: property)),
                          );
                        },
                        child: Text(
                          "Selengkapnya",
                          style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color(0xFF1B0A46),
                          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 13.0),
                          minimumSize: Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
