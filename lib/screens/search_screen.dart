import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<String> recentSearches = [
    'Batan Indah Serpong',
    'The Latinos, Bsd',
    'Puspita Loka, Bsd',
    'OG Loka, BSD',
    'Citra Prima Cisauk',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FD),
      body: SafeArea(
        child: Column(
          children: [
            // Custom AppBar
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
                    "Cari",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF4D2C5E), // Warna ungu
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: "Cari Properti Anda",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),

            // Recent Search
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 24, left: 20, right: 20),
                child: ListView(
                  children: [
                    Text(
                      "Rumah Mewah",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 12),
                    ...recentSearches.map((item) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 18),
                          SizedBox(width: 12),
                          Text(
                            item,
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
