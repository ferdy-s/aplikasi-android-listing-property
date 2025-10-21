# TownzHub Flutter
**Aplikasi Mobile Listing Properti – Desain dan Implementasi Front End**

---

## 1. Ringkasan Proyek
**TownzHub Flutter** merupakan aplikasi mobile yang dikembangkan menggunakan **Flutter** dan **Dart** sebagai solusi digital untuk menampilkan daftar properti seperti rumah, apartemen, vila, dan hotel secara interaktif.  
Proyek ini dirancang secara **end-to-end** oleh **Ferdy Salsabilla**, mencakup seluruh tahapan mulai dari **perancangan UI/UX design**, **pembuatan prototipe**, hingga **implementasi kode program** ke dalam aplikasi yang fungsional dan responsif.

TownzHub hadir sebagai fondasi awal sistem listing properti modern berbasis mobile dengan antarmuka yang elegan, navigasi intuitif, serta arsitektur front end modular yang siap diintegrasikan dengan backend API di masa depan.

---

## 2. Tujuan Pengembangan
Tujuan utama proyek ini adalah membangun sistem antarmuka pengguna (UI) yang efisien, konsisten, dan memiliki fleksibilitas tinggi untuk pengembangan berkelanjutan. Fokus utama pengembangan meliputi:

1. Menerapkan prinsip **Material Design** dan **Human Interface Guidelines** secara optimal.  
2. Membuat struktur kode yang modular dan reusable dengan arsitektur front end terpisah.  
3. Menyusun sistem navigasi, komponen, serta widget dinamis yang mudah dikustomisasi.  
4. Mengimplementasikan seluruh hasil desain UI/UX menjadi tampilan interaktif siap pakai.  

---

## 3. Lingkup Pekerjaan Ferdy Salsabilla
Peran utama: **Flutter Front End Developer & UI/UX Designer**

Tanggung jawab yang diselesaikan sepenuhnya oleh Ferdy Salsabilla mencakup:
- Riset pengalaman pengguna (UX Research) dan pembuatan desain visual (UI Design).
- Pembuatan wireframe, layout grid, serta prototipe interaktif menggunakan Figma.
- Pemilihan sistem warna, tipografi, dan ikonografi yang konsisten dengan identitas brand.
- Implementasi kode Flutter secara penuh dari hasil desain final.
- Optimasi performa UI pada berbagai resolusi dan perangkat.
- Penyusunan dokumentasi teknikal agar mudah diintegrasikan oleh tim backend.

---

## 4. Arsitektur dan Struktur Proyek

```

townzhub_flutter/
│
├── lib/
│   ├── constants/
│   │   └── colors.dart
│   ├── models/
│   │   └── property.dart
│   ├── screens/
│   │   ├── ai_screen.dart
│   │   ├── category_screen.dart
│   │   ├── details_screen.dart
│   │   ├── favorite_screen.dart
│   │   ├── home_screen.dart
│   │   ├── info_content.dart
│   │   ├── login_screen.dart
│   │   ├── more_screen.dart
│   │   ├── profile_screen.dart
│   │   ├── search_screen.dart
│   │   └── splash_screen.dart
│   ├── widgets/
│   │   └── property_card.dart
│   └── main.dart
│
├── assets/
│   ├── ai.png
│   ├── google_icon.png
│   ├── house1.jpeg – house4.jpeg
│   ├── nearby1.jpg – nearby4.jpg
│   ├── logo_app.png
│   ├── logo_townzhub.png
│   └── profile.jpg
│
├── android/
│   ├── app/
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml
│   │           ├── java/
│   │           ├── kotlin/
│   │           └── res/
│   └── build.gradle.kts
│
├── ios/
│   └── (struktur default Flutter)
│
├── pubspec.yaml
└── README.md

````

---

## 5. Desain UI dan Prinsip UX
TownzHub dikembangkan berdasarkan tiga prinsip utama desain modern:

**1. Konsistensi Visual**  
Menggunakan kombinasi warna ungu tua, abu muda, dan putih untuk menghadirkan kontras kuat serta kesan futuristik. Tipografi dipilih dengan fokus pada keterbacaan tinggi.

**2. Navigasi Intuitif**  
Setiap ikon memiliki fungsi yang jelas dan langsung. Bottom navigation bar memudahkan pengguna berpindah antar fitur utama.

**3. Fokus pada Pengalaman Pengguna**  
Desain menonjolkan konten properti dengan visual besar, rating, dan lokasi, sehingga pengguna dapat langsung memperoleh informasi tanpa langkah tambahan.

Semua desain dibuat di **Figma** lalu diimplementasikan sepenuhnya ke dalam Flutter menggunakan pendekatan **Component-Based UI System** untuk memudahkan pemeliharaan dan ekspansi.

---

## 6. Modul dan Fungsionalitas

| Modul | Deskripsi |
|--------|------------|
| **Home Screen** | Menampilkan lokasi pengguna, kategori, rekomendasi, dan properti terdekat. |
| **Category Screen** | Menyediakan filter properti berdasarkan kategori: Apartemen, Rumah, Vila, Hotel. |
| **Details Screen** | Menampilkan informasi properti secara lengkap, termasuk harga dan lokasi. |
| **Favorite Screen** | Daftar properti yang disimpan pengguna sebagai favorit. |
| **Profile Screen** | Halaman profil pengguna dengan navigasi ke pengaturan lainnya. |
| **Search Screen** | Pencarian cepat berdasarkan nama properti atau lokasi. |
| **Splash Screen** | Layar pembuka aplikasi sebelum masuk ke halaman utama. |
| **Property Card Widget** | Komponen reusable untuk menampilkan kartu properti dinamis. |

---

## 7. Teknologi dan Dependensi

| Komponen | Teknologi |
|-----------|------------|
| Framework | Flutter 3.x |
| Bahasa | Dart |
| Build System | Gradle |
| IDE | Android Studio / Visual Studio Code |
| Desain UI | Figma |
| Library | Material Components, Google Fonts |
| Target Platform | Android (dapat diperluas ke iOS) |

Dependensi utama (dalam `pubspec.yaml`):
- `flutter`
- `cupertino_icons`
- `google_fonts`
- `flutter_svg` *(opsional untuk ikon SVG)*

---

## 8. Proses Pengembangan

**Tahap 1 – Riset dan Perancangan UX**
- Analisis perilaku pengguna aplikasi properti di Indonesia.  
- Menentukan kebutuhan fitur utama dan arus navigasi pengguna.  
- Membuat user journey serta struktur informasi.  

**Tahap 2 – Desain UI dan Prototipe**
- Pembuatan wireframe, layout grid, sistem warna, dan tipografi.  
- Mendesain prototipe interaktif dengan Figma.  
- Pengujian visual desain sebelum implementasi kode.  

**Tahap 3 – Implementasi Kode**
- Mengonversi hasil desain menjadi komponen Flutter.  
- Menyusun struktur folder modular (`screens`, `widgets`, `models`).  
- Implementasi navigasi, layout responsif, dan sistem komponen reusable.  

**Tahap 4 – Optimasi dan Pengujian**
- Optimalisasi performa UI dan loading asset.  
- Validasi tampilan pada berbagai ukuran layar.  
- Pemeriksaan fungsionalitas dan transisi antar halaman.  

---

## 9. Cara Menjalankan Proyek

### Prasyarat
Pastikan sistem telah menginstal:
- Flutter SDK versi terbaru  
- Android SDK dan Android Studio  
- Emulator Android atau perangkat fisik  

### Langkah Eksekusi
```bash
# Clone repository
git clone https://github.com/ferdy-s/aplikasi-android-listing-property.git
cd townzhub_flutter

# Unduh dependensi
flutter pub get

# Jalankan aplikasi
flutter run

# Build APK untuk distribusi
flutter build apk --release
````

---

## 10. Pengujian dan Validasi

Pengujian dilakukan melalui:

* **Manual UI Testing** pada emulator dan perangkat fisik Android.
* **Responsive Test** untuk memastikan kompatibilitas lintas perangkat.
* **Navigation Flow Verification** untuk menguji stabilitas interaksi antar layar.

Hasil validasi menunjukkan seluruh elemen berfungsi sesuai desain tanpa error atau lag visual.

---

## 11. Dokumentasi Visual

### Home Screen

Menampilkan lokasi pengguna, kategori, dan rekomendasi properti.
![Home Screen Preview](docs/home_screen.png)

### Detail Screen

Menampilkan harga, lokasi, dan deskripsi properti.
![Detail Screen Preview](docs/detail_screen.png)

---

## 12. Kesimpulan Teknis

Proyek **TownzHub Flutter** merupakan hasil nyata dari proses **end-to-end front-end engineering** yang dimulai dari desain konseptual hingga implementasi kode.
Struktur kode yang modular, efisien, dan terorganisir menjadikan proyek ini siap untuk pengembangan lanjutan ke tahap backend integration dan publikasi aplikasi komersial.

Proyek ini menegaskan kompetensi **Ferdy Salsabilla** dalam membangun aplikasi mobile modern berbasis **Flutter** dengan pendekatan **UI/UX-driven development** yang profesional.

---

## 13. Profil Pengembang

* **Nama:** Ferdy Salsabilla
* **Peran:** Flutter Front End Developer & UI/UX Designer
* **Fokus:** Pengembangan aplikasi mobile berbasis Flutter, desain antarmuka modern, dan sistem modular.
* **Institusi / Tim:** DCLIQ Digital Agency
* **Email:** [info@dcliq.co.id](mailto:info@dcliq.co.id)
* **Website:** [https://dcliq.co.id](https://dcliq.co.id)
* **Lokasi:** Tangerang Selatan, Indonesia

---

## 14. Lisensi

Proyek ini bersifat internal dan digunakan untuk tujuan pengembangan serta portofolio profesional.
Seluruh aset visual dan desain merupakan milik DCLIQ Digital Agency dan hanya digunakan untuk demonstrasi antarmuka aplikasi.

---

© 2025 Ferdy Salsabilla – All Rights Reserved.

```
