import 'package:flutter/material.dart';
import '../models/property.dart';
import 'package:palette_generator/palette_generator.dart';


class DetailsScreen extends StatefulWidget {
  final Property property;

  const DetailsScreen({Key? key, required this.property}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late PageController _pageController;
  int _selectedImageIndex = 0;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedImageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final property = widget.property;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          // Gambar utama
          Stack(
            children: [
              SizedBox(
                height: 340,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedImageIndex = index;
                    });
                  },
                  itemCount: property.images.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      property.images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    );
                  },
                ),
              ),
              Positioned(
                top: 48,
                left: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              Positioned(
                top: 48,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite_border, color: Colors.red),
                ),
              ),
              Positioned(
                top: 52,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "Details Home",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),


          // Container bawah melengkung
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
              child: Container(
                color: Color(0xFFF8F8F8),
                padding: EdgeInsets.fromLTRB(22, 29, 20, 12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Judul dan harga
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.title,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            property.price,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                          SizedBox(width: 4),
                          Text(
                            property.location,
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                      SizedBox(height: 16),



                      // Deskripsi
                      Text("Description", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      AnimatedCrossFade(
                        firstChild: Text(
                          property.description,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        secondChild: Text(
                          property.description,
                          style: TextStyle(color: Colors.black87, fontSize: 14),
                        ),
                        crossFadeState: isExpanded
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        duration: Duration(milliseconds: 300),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isExpanded = !isExpanded;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Text(
                            isExpanded ? "Read Less" : "Read More",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      // Badge info + fitur dinamis
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: [
                          _infoBadge(Icons.bed, "${property.bedrooms} Bed"),
                          _infoBadge(Icons.bathtub, "${property.bathrooms} Bathroom"),
                          _infoBadge(Icons.square_foot, property.size),
                          ...?property.features?.map((feature) {
                            final icon = _getFeatureIcon(feature);
                            return _infoBadge(icon, feature);
                          }),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Gallery
                      Text("Gallery", style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 12),
                      SizedBox(
                        height: 80,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: property.images.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedImageIndex = index;
                                  _pageController.jumpToPage(index);
                                });
                              },
                              child: Container(
                                width: 80,
                                margin: EdgeInsets.only(right: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: index == _selectedImageIndex
                                        ? Color(0xFF1B0A46)
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                    image: AssetImage(property.images[index]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 24),

                      // Harga & Hubungi
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            property.price,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B0A46),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: Text("Hubungi"),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoBadge(IconData? icon, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: Color(0xFF1B0A46),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, color: Colors.white, size: 16),
            SizedBox(width: 6),
          ],
          Text(label, style: TextStyle(color: Colors.white, fontSize: 13)),
        ],
      ),
    );
  }

  IconData _getFeatureIcon(String feature) {
    final f = feature.toLowerCase();
    if (f.contains('garasi')) return Icons.local_parking;
    if (f.contains('dapur')) return Icons.kitchen;
    if (f.contains('wifi')) return Icons.wifi;
    if (f.contains('keamanan')) return Icons.security;
    if (f.contains('ac')) return Icons.thermostat;
    if (f.contains('kolam')) return Icons.pool;
    if (f.contains('taman')) return Icons.park;
    return Icons.check_circle_outline;
  }
}
