class Property {
  final String title;
  final String location;
  final String description;
  final String price;
  final int bedrooms;
  final int bathrooms;
  final String size;
  final List<String> images;
  final List<String>? features;
  final String type; // ✅ Tambahan ini

  Property({
    required this.title,
    required this.location,
    required this.description,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.images,
    this.features,
    required this.type, // ✅ Tambahan ini di konstruktor
  });

  static List<Property> sampleData() {
    return [
      Property(
        title: 'Puspita Loka II',
        location: 'BSD, Tangerang Selatan',
        description:
        'Rumah ini menggabungkan desain elegan dan kenyamanan modern, menciptakan suasana hangat bagi penghuninya. Dengan ruang tamu yang luas dan pencahayaan alami yang optimal, setiap sudut rumah terasa lapang dan menyenangkan.',
        price: 'Rp. 5,9 M',
        bedrooms: 3,
        bathrooms: 2,
        size: '1.234 x 2345 m',
        images: [
          'assets/house1.jpeg',
          'assets/house2.jpeg',
          'assets/house3.jpeg',
          'assets/house4.jpeg',
        ],
        features: [
          '2 Garasi',
          'Dapur Modern',
          'Wi-Fi',
          'Sistem Keamanan',
          'AC Sentral',
          'Kolam Renang',
        ],
        type: 'Rumah', // ✅ Tambahkan ini
      ),
      Property(
        title: 'Luxury Villa',
        location: 'Bali, Indonesia',
        description:
        'Villa mewah dengan pemandangan laut yang menakjubkan. Dirancang untuk kenyamanan maksimal, dilengkapi taman tropis, kolam pribadi, dan area relaksasi.',
        price: 'Rp. 12,3 M',
        bedrooms: 5,
        bathrooms: 4,
        size: '2.500 x 3000 m',
        images: [
          'assets/villa1.jpeg',
          'assets/villa2.jpeg',
          'assets/villa3.jpeg',
        ],
        features: [
          'Taman Luas',
          'Kolam Renang',
          'AC Sentral',
          'Dapur Terbuka',
          'Wi-Fi',
          'Garasi Tertutup',
        ],
        type: 'Vila', // ✅ Tambahkan ini
      ),
    ];
  }
}
