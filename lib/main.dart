import 'package:flutter/material.dart';

void main() {
  // Titik masuk utama aplikasi Flutter
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Widget root dari aplikasi
    return MaterialApp(
      title: 'Layout Aplikasi Mobile', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.blue, // Warna tema utama
        visualDensity: VisualDensity.adaptivePlatformDensity, // Desain responsif
      ),
      home: const HomeScreen(), // Layar pertama yang ditampilkan
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Kerangka dasar layout material design
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Aplikasi Mobile'), // Judul app bar
        actions: [ // Tombol aksi di app bar
          IconButton(icon: const Icon(Icons.search), onPressed: () {}), // Tombol search
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}), // Tombol menu
        ],
      ),
      
      // Area konten yang bisa di-scroll
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // Merentangkan children secara horizontal
          children: [
            // Header dengan gambar background dan overlay gradient
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/seed/flutter/800/400'),
                  fit: BoxFit.cover, // Menutupi seluruh container
                ),
                gradient: LinearGradient( // Overlay gradient
                  colors: [
                    Colors.blue.withAlpha(180), // Biru semi-transparan
                    Colors.blue.withAlpha(80), // Biru lebih transparan
                  ],
                ),
              ),
              child: Center(
                child: Text('Selamat Datang', style: TextStyle(/* Gaya teks */)),
              ),
            ),
            
            // Judul section fitur
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Fitur Utama', style: TextStyle(/* Gaya teks */)),
            ),
            
            // Grid card fitur (2 kolom)
            GridView.count(
              shrinkWrap: true, // Hanya mengambil ruang yang dibutuhkan
              physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll
              crossAxisCount: 2, // 2 kolom
              padding: const EdgeInsets.all(16),
              children: [
                FeatureCard(icon: Icons.shopping_cart, title: 'Belanja', color: Colors.blue),
                FeatureCard(icon: Icons.map, title: 'Lokasi', color: Colors.green),
                FeatureCard(icon: Icons.chat, title: 'Pesan', color: Colors.orange),
                FeatureCard(icon: Icons.settings, title: 'Pengaturan', color: Colors.purple),
              ],
            ),
            
            const SizedBox(height: 16), // Pemisah
          ],
        ),
      ),
      
      // Navigasi bawah
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Tab yang aktif
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Jelajahi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

// Komponen card fitur yang bisa digunakan ulang
class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const FeatureCard({super.key, required this.icon, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Kedalaman bayangan
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Sudut melengkung
      child: InkWell( // Membuat card bisa diklik
        onTap: () {}, // Handler klik (bisa diimplementasikan)
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon dengan background lingkaran
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withAlpha(50), // Warna dasar transparan
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 32, color: color),
              ),
              const SizedBox(height: 12), // Pemisah
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}