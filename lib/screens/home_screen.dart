import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'search_screen.dart';
import 'favorite_screen.dart';
import 'profile_screen.dart';
import 'ai_screen.dart';
import '../models/property.dart';
import 'details_screen.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final List<Widget> _screens = [
    HomeTabContent(),
    SearchScreen(),
    FavoriteScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: _page >= 2 ? _page + 1 : _page, // sesuaikan index agar ikon tengah tidak terhitung
        height: 75.0,
        items: <Widget>[
          Align(
            alignment: Alignment(0, 0.694), // sedikit turun
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
        onTap: (index) {
          if (index == 2) return; // ikon tengah (ai)
          setState(() {
            _page = index > 2 ? index - 1 : index; // sesuaikan index stack
          });
        },
        letIndexChange: (index) => true,
      ),
      body: IndexedStack(
        index: _page,
        children: _screens,
      ),
    );
  }
}

class HomeTabContent extends StatefulWidget {
  @override
  _HomeTabContentState createState() => _HomeTabContentState();
}

class _HomeTabContentState extends State<HomeTabContent> {
  String _selectedLocation = "Bumi Serpong Damai";
  List<Property> allProperties = [
    Property(
      title: "Skyline Paramount Serpong",
      location: "Gading Serpong",
      price: "Rp 2,91 M",
      bedrooms: 3,
      bathrooms: 2,
      size: "120 m²",
      description: "Apartemen mewah dengan fasilitas lengkap.",
      images: ["assets/house1.jpeg"],
      features: ["Kolam Renang", "Gym", "Parkir Basement"],
      type: "Apartemen",
    ),
  Property(
  title: "Apartemen Nyaman 1",
  location: "Alam Sutera",
  price: "Rp 2.9 M",
  bedrooms: 3,
  bathrooms: 2,
  size: "394 m²",
  description: "Apartemen elegan dan nyaman dengan fasilitas terbaik di kelasnya.",
  images: ["assets/house2.jpeg"],
  features: ["Parkir Basement", "Keamanan 24 Jam", "Kolam Renang"],
  type: "Apartemen",
  ),
  Property(
  title: "Apartemen Nyaman 2",
  location: "Citra Raya",
  price: "Rp 5.13 M",
  bedrooms: 1,
  bathrooms: 2,
  size: "242 m²",
  description: "Apartemen elegan dan nyaman dengan fasilitas terbaik di kelasnya.",
  images: ["assets/house3.jpeg"],
  features: ["Gym", "Lift", "Parkir Basement"],
  type: "Apartemen",
  ),
  Property(
  title: "Apartemen Nyaman 3",
  location: "Summarecon",
  price: "Rp 3.97 M",
  bedrooms: 3,
  bathrooms: 2,
  size: "189 m²",
  description: "Apartemen elegan dan nyaman dengan fasilitas terbaik di kelasnya.",
  images: ["assets/house4.jpeg"],
  features: ["Lift", "Gym", "Keamanan 24 Jam"],
  type: "Apartemen",
  ),
  Property(
  title: "Apartemen Nyaman 4",
  location: "Alam Sutera",
  price: "Rp 3.38 M",
  bedrooms: 2,
  bathrooms: 2,
  size: "112 m²",
  description: "Apartemen elegan dan nyaman dengan fasilitas terbaik di kelasnya.",
  images: ["assets/house1.jpeg"],
  features: ["Lift", "Keamanan 24 Jam", "Kolam Renang"],
  type: "Apartemen",
  ),
  Property(
  title: "Apartemen Nyaman 5",
  location: "Summarecon",
  price: "Rp 3.61 M",
  bedrooms: 4,
  bathrooms: 2,
  size: "155 m²",
  description: "Apartemen elegan dan nyaman dengan fasilitas terbaik di kelasnya.",
  images: ["assets/house2.jpeg"],
  features: ["Parkir Basement", "Lift", "Kolam Renang"],
  type: "Apartemen",
  ),
  Property(
      title: "Rumah Hijau Lestari",
      location: "BSD City",
      price: "Rp 1,8 M",
      bedrooms: 4,
      bathrooms: 2,
      size: "160 m²",
      description: "Rumah nyaman dekat fasilitas umum.",
      images: ["assets/house2.jpeg"],
      features: ["Taman", "Garasi"],
      type: "Rumah",
    ),
    Property(
      title: "Hotel Bintang 5",
      location: "Alam Sutera",
      price: "Rp 5 Jt",
      bedrooms: 2,
      bathrooms: 2,
      size: "80 m²",
      description: "Kamar hotel premium dengan layanan lengkap.",
      images: ["assets/house3.jpeg"],
      features: ["Restoran", "Spa", "Kolam Renang"],
      type: "Hotel",
    ),
    Property(
      title: "Red Dorrz",
      location: "Gading Serpong",
      price: "Rp 500K",
      bedrooms: 1,
      bathrooms: 2,
      size: "80 m²",
      description: "Kamar hotel premium dengan layanan lengkap, serta di isi dengan adanya berbagai layanan kamar yang menarik per mnalamnya",
      images: ["assets/house1.jpeg"],
      features: ["Restoran", "Spa", "Kolam Renang"],
      type: "Hotel",
    ),
    Property(
      title: "Airi Rooms",
      location: "Sumarecon Serpong",
      price: "Rp 250K",
      bedrooms: 1,
      bathrooms: 2,
      size: "80 m²",
      description: "Kamar hotel premium dengan layanan lengkap, serta di isi dengan adanya berbagai layanan kamar yang menarik per mnalamnya",
      images: ["assets/house2.jpeg"],
      features: ["Restoran", "Spa", "Kolam Renang"],
      type: "Hotel",
    ),
    Property(
      title: "Reed doors",
      location: "Regen Town, BSD",
      price: "Rp 150K",
      bedrooms: 1,
      bathrooms: 1,
      size: "110 m²",
      description: "Kamar hotel dengan kenyamanan luar biasa yang terdapat di dalam sebuah ruangan",
      images: ["assets/house4.jpeg"],
      features: ["Makan SIang", "Spa", "Kolam Renang"],
      type: "Hotel",
    ),
    Property(
      title: "Vila Asri Sentul",
      location: "Sentul City",
      price: "Rp 3,2 M",
      bedrooms: 5,
      bathrooms: 3,
      size: "300 m²",
      description: "Vila tropis dengan pemandangan pegunungan.",
      images: ["assets/house4.jpeg"],
      features: ["Taman Luas", "Gazebo", "Kolam Renang"],
      type: "Vila",
    ),
    Property(
      title: "Vila Bukit dago",
      location: "Serpong,BSD",
      price: "Rp 3,2 M",
      bedrooms: 5,
      bathrooms: 3,
      size: "300 m²",
      description: "Vila dengan nuansa kedamaian luar biasa.",
      images: ["assets/house2.jpeg"],
      features: ["Teras Luas", "Gym", "Kolam Renang"],
      type: "Vila",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                      Text("Lokasi Kamu", style: TextStyle(fontSize: 13, color: Colors.grey)),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PopupMenuButton<String>(
                            onSelected: (value) {
                              setState(() {
                                _selectedLocation = value;
                              });
                            },
                            itemBuilder: (context) => [
                              PopupMenuItem(value: "Alam Sutera", child: Text("Alam Sutera")),
                              PopupMenuItem(value: "Gading Serpong", child: Text("Gading Serpong")),
                              PopupMenuItem(value: "Bumi Serpong Damai", child: Text("Bumi Serpong Damai")),
                              PopupMenuItem(value: "Sumarecon Serpong", child: Text("Sumarecon Serpong")),
                            ],
                            child: Row(
                              children: [
                                Text(_selectedLocation, style: TextStyle(fontWeight: FontWeight.bold)),
                                Icon(Icons.keyboard_arrow_down),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
            SizedBox(height: 17),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildCategoryIcon(Icons.apartment, "Apartemen", onTap: () {
                    final list = allProperties
                        .where((prop) => prop.type.toLowerCase().trim() == 'apartemen')
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: "Apartemen",
                          properties: list,
                        ),
                      ),
                    );
                  }),
                  _buildCategoryIcon(Icons.house, "Rumah", onTap: () {
                    final list = allProperties
                        .where((prop) => prop.type.toLowerCase().trim() == 'rumah')
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: "Rumah",
                          properties: list,
                        ),
                      ),
                    );
                  }),
                  _buildCategoryIcon(Icons.hotel, "Hotel", onTap: () {
                    final list = allProperties
                        .where((prop) => prop.type.toLowerCase().trim() == 'hotel')
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: "Hotel",
                          properties: list,
                        ),
                      ),
                    );
                  }),
                  _buildCategoryIcon(Icons.villa, "Vila", onTap: () {
                    final list = allProperties
                        .where((prop) => prop.type.toLowerCase().trim() == 'vila')
                        .toList();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: "Vila",
                          properties: list,
                        ),
                      ),
                    );
                  }),
                  _buildCategoryIcon(Icons.apps, "More", onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CategoryScreen(
                          category: "Semua Properti",
                          properties: allProperties,
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Rekomondasi", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("view all", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 12),
            _buildRecommendationCard(),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tempat Terdekat", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Text("More", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SizedBox(height: 12),
            _buildNearbyPlaces(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Color(0xFF1B0A46),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: Colors.white, size: 28),
            alignment: Alignment.center,
          ),
          SizedBox(height: 12),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildRecommendationCard() {
    List<Property> properties = [
      Property(
        title: "Puspita Loka II",
        location: "BSD, Tangerang Selatan",
        price: "Rp. 5,9 M",
        bedrooms: 3,
        bathrooms: 2,
        size: "123 x 234 m",
        description: '''
Puspita Loka II adalah hunian bergaya modern minimalis yang terletak di pusat kawasan BSD, Tangerang Selatan. Rumah ini menawarkan kenyamanan optimal dengan pencahayaan alami dan tata ruang terbuka yang menyatu harmonis dengan lingkungan sekitar.

Dilengkapi dengan 3 kamar tidur yang luas, 2 kamar mandi elegan, dapur modern dengan material premium, serta ruang keluarga yang dirancang untuk interaksi hangat bersama keluarga.

Tersedia juga garasi luas untuk 2 mobil, serta sistem keamanan terintegrasi yang memberikan ketenangan dan rasa aman bagi penghuni.

Hunian ini cocok bagi keluarga yang menginginkan tempat tinggal eksklusif, tenang, dan mudah diakses dari berbagai fasilitas umum dan pusat bisnis.
''',
        images: [
          "assets/house1.jpeg",
          "assets/house2.jpeg",
          "assets/house3.jpeg",
        ],
        features: [
          "2 Garasi",
          "Dapur Modern",
          "Wi-Fi",
          "Sistem Keamanan",
        ],
        type: "Rumah", // ✅ Tambahkan type
      ),
      Property(
        title: "Permata Serpong",
        location: "Gading Serpong",
        price: "Rp. 3,2 M",
        bedrooms: 4,
        bathrooms: 3,
        size: "200 x 300 m",
        description:
        "Hunian nyaman dan tenang di jantung Gading Serpong. dengan menerapkan sistem keamanan berbasis IOT ini mengindikasikan bahwa perumahan ini bebas maling dan terpantau 24 jam",
        images: [
          "assets/house2.jpeg",
          "assets/house1.jpeg",
          "assets/house4.jpeg",
        ],
        features: [
          "AC Sentral",
          "Kolam Renang",
          "Smart Lock",
        ],
        type: "Rumah", // ✅ Tambahkan type
      ),
      Property(
        title: "Villa Alam Sutera",
        location: "Alam Sutera, Tangerang",
        price: "Rp. 7,5 M",
        bedrooms: 5,
        bathrooms: 4,
        size: "300 x 400 m",
        description: "Villa luas dengan taman pribadi dan kolam renang.",
        images: [
          "assets/house3.jpeg",
          "assets/house2.jpeg",
          "assets/house1.jpeg",
        ],
        features: [
          "Taman Luas",
          "Kolam Renang",
          "AC Sentral",
          "Garasi Tertutup",
        ],
        type: "Vila", // ✅ Tambahkan type
      ),
      Property(
        title: "Green Residence",
        location: "Summarecon Serpong",
        price: "Rp. 4,0 M",
        bedrooms: 3,
        bathrooms: 2,
        size: "180 x 250 m",
        description:
        "Rumah eco-friendly dengan lingkungan hijau dan asri. Dengan Hunian nyaman yang di kelilingi oleh alam di dalamnya",
        images: [
          "assets/house4.jpeg",
          "assets/house3.jpeg",
          "assets/house2.jpeg",
        ],
        features: [
          "Ramah Lingkungan",
          "Panel Surya",
          "Sistem Drainase Modern",
        ],
        type: "Rumah", // ✅ Tambahkan type
      ),
    ];

    return Container(
      height: 235,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: properties.length,
        itemBuilder: (context, index) {
          final property = properties[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(property: property),
                ),
              );
            },
            child: Container(
              width: 250,
              margin: EdgeInsets.only(right: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(16.0)),
                    child: Image.asset(
                      property.images[0],
                      height: 140,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(property.title,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(property.location,
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.bed, size: 16),
                                Text(property.bedrooms.toString()),
                                SizedBox(width: 9),
                                Icon(Icons.bathtub, size: 16),
                                Text(property.bathrooms.toString()),
                              ],
                            ),
                            Text(property.price,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }




  Widget _buildNearbyPlaces() {
    final List<String> labels = [
      "Penitipan Anak",
      "Kursus Musik",
      "Kursus Bahasa",
      "Les Privat",
    ];


    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(16.0)),
                  child: Image.asset(
                    'assets/nearby${index + 1}.jpg',
                    height: 100,
                    width: 160,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Center( // ← Ini untuk menengahkan teks vertikal dan horizontal
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        labels[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

}
