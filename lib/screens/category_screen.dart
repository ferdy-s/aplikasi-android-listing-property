import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import '../models/property.dart';
import 'details_screen.dart';
import 'search_screen.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';
import 'home_screen.dart';
import '../widgets/property_card.dart';
import 'info_content.dart';

class CategoryScreen extends StatefulWidget {
  final String category;
  final List<Property> properties;

  const CategoryScreen({
    Key? key,
    required this.category,
    required this.properties,
  }) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}
void _showApartmentInfo(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        expand: false,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          // ... (isi sama seperti sebelumnya)
        ),
      );
    },
  );
}

class _CategoryScreenState extends State<CategoryScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    Placeholder(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  void _onTapNav(int index) {
    if (index == 2) return;
    final adjustedIndex = index > 2 ? index - 1 : index;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => _screens[adjustedIndex]),
    );
  }

  IconData _getCategoryIcon(String category) {
    switch (category.toLowerCase()) {
      case 'rumah':
        return Icons.house;
      case 'hotel':
        return Icons.hotel;
      case 'villa':
      case 'vila':
        return Icons.villa;
      default:
        return Icons.apartment;
    }
  }

  List<Property> _generateDummyProperties(String type) {
    return List.generate(10, (index) => Property(
      title: "$type \${index + 1}",
      location: "BSD, Tangerang Selatan",
      price: type == "Hotel" ? "Rp \${(400 + index * 10)}K" : "Rp \${(2.5 + index * 0.3).toStringAsFixed(2)} M",
      bedrooms: 3,
      bathrooms: 2,
      size: "120 m²",
      description: "$type berkualitas tinggi dengan fasilitas modern.",
      images: ["assets/house\${(index % 4) + 1}.jpeg"],
      features: ["Kolam Renang", "Parkir", "Wi-Fi"],
      type: type,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final properties = widget.properties.isEmpty ? _generateDummyProperties(widget.category) : widget.properties;

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page >= 2 ? _page + 1 : _page,
        height: 75.0,
        items: <Widget>[
          Align(
            alignment: Alignment(0, 0.694),
            child: Icon(Icons.home, size: 35, color: Colors.white),
          ),
          Align(
            alignment: Alignment(0, 0.694),
            child: Icon(Icons.search, size: 35, color: Colors.white),
          ),
          Align(
            alignment: Alignment(0, 0.694),
            child: Icon(Icons.apps, size: 35, color: Colors.white),
          ),
          Align(
            alignment: Alignment(0, 0.694),
            child: Icon(Icons.favorite_border, size: 35, color: Colors.white),
          ),
          Align(
            alignment: Alignment(0, 0.694),
            child: Icon(Icons.person_outline, size: 35, color: Colors.white),
          ),
        ],
        color: Color(0xFF0F0529),
        buttonBackgroundColor: Color(0xFF0F0529),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: _onTapNav,
        letIndexChange: (index) => true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/ai.png', height: 50),
                      CircleAvatar(
                        radius: 26,
                        backgroundImage: AssetImage('assets/profile.jpg'),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Pilih Lokasi", style: TextStyle(fontSize: 13, color: Colors.grey)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("BSD, Indonesia", style: TextStyle(fontWeight: FontWeight.bold)),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Cari Kota Dan Lokasi",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Color(0xFF1B0A46),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF1B0A46),
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_getCategoryIcon(widget.category), color: Colors.white),
                    SizedBox(width: 100),
                    Text(
                      widget.category,
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 100),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => InfoContent(category: widget.category),
                          ),
                        );
                      },
                      child: Icon(Icons.info_outline, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Unggulan", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("view all", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.73,
                  ),
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final property = properties[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DetailsScreen(property: property),
                          ),
                        );
                      },
                      child: PropertyCard(property: property),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

