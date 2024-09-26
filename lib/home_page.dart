import 'package:flutter/material.dart';
import 'package:pertemuan3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var namauser;
  List<Map<String, String>> animeList = []; // Daftar anime
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageUrlController = TextEditingController(); // Controller untuk URL gambar

  void _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    setState(() {});
  }

  void _addAnime() {
    if (_nameController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _imageUrlController.text.isNotEmpty) {
      setState(() {
        animeList.add({
          'name': _nameController.text,
          'description': _descriptionController.text,
          'image': _imageUrlController.text,
        });
        _nameController.clear();
        _descriptionController.clear();
        _imageUrlController.clear();
      });
      Navigator.of(context).pop();
    }
  }

  void _showAddAnimeDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Anime'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Anime Name'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
              ),
              TextField(
                controller: _imageUrlController,
                decoration: const InputDecoration(labelText: 'Image URL'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                _addAnime();
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _loadUsername();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Beranda',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showAddAnimeDialog, // Menampilkan dialog untuk menambahkan anime
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[900],
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: animeList.length,
                itemBuilder: (context, index) {
                  final anime = animeList[index];
                  return Card(
                    elevation: 5,
                    color: Colors.grey[800],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            anime['image']!, // Mengambil URL gambar
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            anime['name']!,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            anime['description']!,
                            style: const TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}
