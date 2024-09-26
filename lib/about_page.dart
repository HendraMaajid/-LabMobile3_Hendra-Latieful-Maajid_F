import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Tentang Kami',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),


      ),
      backgroundColor: Colors.grey[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Center(
                child: Image.asset(
                  'assets/images/about_header.png',
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Tentang Kami',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Kami adalah platform yang memudahkan para penggemar anime untuk menemukan, menonton, dan menyimpan daftar anime favorit mereka.',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(height: 20),


              const Text(
                'Fitur Utama:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              _buildFeatureCard('Daftar Favorit', 'Simpan anime kesukaanmu dengan mudah.'),
              _buildFeatureCard('Rilis Terbaru', 'Selalu update dengan anime yang baru dirilis.'),
              _buildFeatureCard('Informasi Lengkap', 'Dapatkan detail lengkap setiap anime.'),
              const SizedBox(height: 20),


              const Text(
                'Kontak Kami:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 10),
              const Text(
                'Email: support@animelist.com',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      drawer: const Sidemenu(),
    );
  }


  Widget _buildFeatureCard(String title, String description) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.grey[800],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}
