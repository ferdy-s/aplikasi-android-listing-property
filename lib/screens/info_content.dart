import 'package:flutter/material.dart';

class InfoContent extends StatelessWidget {
  final String category;

  const InfoContent({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final info = _getInfoByCategory(category);

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFF1B0A46),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.info, color: Colors.white),
                  ),
                  Center(
                    child: Text(
                      'Information',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundImage: AssetImage('assets/profile.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(info['judul']!, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text(info['deskripsi']!),
                    SizedBox(height: 16),
                    Text("Keuntungan Tinggal di $category:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    ...(info['keuntungan'] as List<String>).map(_buildBullet),
                    SizedBox(height: 16),
                    Text("Tips Memilih $category:", style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    ...(info['tips'] as List<String>).map(_buildBullet),
                    SizedBox(height: 16),
                    Text(info['penutup']!),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B0A46),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            ),
                            onPressed: () => Navigator.pop(context),
                            child: Text("Kembali", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF1B0A46),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                            ),
                            onPressed: () {
                              // Aksi AI di sini
                            },
                            child: Text("Coba AI", style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• "),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }

  Map<String, dynamic> _getInfoByCategory(String category) {
    switch (category.toLowerCase()) {
      case 'rumah':
        return {
          'judul': "Apa itu Rumah?",
          'deskripsi': "Rumah adalah tempat tinggal pribadi yang berdiri di atas tanah sendiri dan cocok untuk keluarga.",
          'keuntungan': [
            "Privasi tinggi dan ruang yang luas.",
            "Bebas renovasi dan ekspansi bangunan.",
            "Area luar seperti taman pribadi atau garasi.",
          ],
          'tips': [
            "Periksa lingkungan dan fasilitas sekitar.",
            "Cek legalitas dan sertifikat tanah.",
            "Pertimbangkan jarak ke tempat kerja atau sekolah.",
          ],
          'penutup': "Apakah Anda ingin kami bantu memilih rumah terbaik dengan teknologi AI? 😊"
        };
      case 'hotel':
        return {
          'judul': "Apa itu Hotel?",
          'deskripsi': "Hotel adalah akomodasi sementara yang menawarkan layanan dan fasilitas untuk wisatawan atau pelancong.",
          'keuntungan': [
            "Layanan lengkap seperti room service, laundry, dan restoran.",
            "Keamanan dan kenyamanan tinggi.",
            "Lokasi strategis di pusat kota atau destinasi wisata.",
          ],
          'tips': [
            "Bandingkan harga dan ulasan pengguna.",
            "Pilih hotel sesuai kebutuhan (bisnis, liburan, dll).",
            "Periksa fasilitas tambahan seperti sarapan atau parkir.",
          ],
          'penutup': "Butuh rekomendasi hotel terbaik dengan bantuan AI? 😊"
        };
      case 'vila':
      case 'villa':
        return {
          'judul': "Apa itu Vila?",
          'deskripsi': "Vila adalah hunian eksklusif yang biasanya berada di area wisata dan menawarkan privasi serta kenyamanan seperti di rumah sendiri.",
          'keuntungan': [
            "Ruang luas dan fasilitas pribadi.",
            "Cocok untuk liburan keluarga atau grup.",
            "Suasana tenang dan jauh dari keramaian kota.",
          ],
          'tips': [
            "Pilih lokasi strategis dekat atraksi wisata.",
            "Periksa kebijakan penyewaan dan keamanan.",
            "Pastikan ada dapur dan ruang tamu lengkap.",
          ],
          'penutup': "Tertarik mencari vila ideal dengan bantuan AI? 😊"
        };
      default:
        return {
          'judul': "Apa itu Apartemen?",
          'deskripsi': "Apartemen adalah unit hunian dalam sebuah gedung bertingkat yang dapat disewakan atau dimiliki.",
          'keuntungan': [
            "Lokasi Strategis – Dekat dengan pusat kota, perkantoran, dan transportasi umum.",
            "Fasilitas Lengkap – Kolam renang, gym, keamanan 24 jam, dan lainnya.",
            "Keamanan Terjamin – Dilengkapi dengan CCTV dan petugas keamanan.",
            "Perawatan Mudah – Tidak perlu repot mengurus halaman atau eksterior bangunan.",
          ],
          'tips': [
            "Periksa lokasi dan akses transportasi.",
            "Sesuaikan dengan anggaran dan kebutuhan.",
            "Pastikan fasilitas mendukung gaya hidup Anda.",
          ],
          'penutup': "Apakah Anda ingin saya rekomendasikan apartemen dengan menggunakan AI? 😊"
        };
    }
  }
}
