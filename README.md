# Anime List App

Aplikasi ini memungkinkan pengguna untuk menambahkan dan melihat daftar anime favorit mereka. Dibangun menggunakan Flutter dan menyimpan data pengguna secara lokal menggunakan SharedPreferences.

## Fitur

- **Tambah Anime**: Pengguna dapat menambahkan anime baru dengan nama, deskripsi, dan URL gambar.
- **Lihat Daftar Anime**: Daftar anime yang telah ditambahkan ditampilkan dalam bentuk kartu dengan gambar, nama, dan deskripsi.


## Cara Menjalankan Aplikasi

1. Pastikan Anda telah menginstal Flutter di sistem Anda. Jika belum, ikuti panduan instalasi di [sini](https://flutter.dev/docs/get-started/install).
2. Clone repositori ini:
    ```bash
    git clone <URL_REPOSITORI_ANDA>
    ```
3. Masuk ke direktori proyek:
    ```bash
    cd <NAMA_DIREKTORI_PROYEK>
    ```
4. Jalankan perintah berikut untuk menginstal dependensi:
    ```bash
    flutter pub get
    ```
5. Jalankan aplikasi:
    ```bash
    flutter run
    ```

## Struktur Proyek

- `lib/home_page.dart`: Berisi kode untuk halaman utama aplikasi, termasuk logika untuk menambahkan dan menampilkan daftar anime.
- `lib/about_page.dart`: Berisi kode untuk halaman tentang aplikasi.
- `lib/sidemenu.dart`: Berisi kode untuk menu samping aplikasi.
- `lib/login_page.dart`: Berisi kode untuk halaman login aplikasi.
- `lib/main.dart`: Berisi kode untuk konfigurasi aplikasi dan routing.

## Fungsi Tambah Anime
```dart
      void addAnime(String name, String description, String imageUrl) {
        setState(() {
          animeList.add(Anime(name: name, description: description, imageUrl: imageUrl));
          saveAnimeList();
        });
      }
      void showAddAnimeDialog(BuildContext context) {
        final nameController = TextEditingController();
        final descriptionController = TextEditingController();
        final imageUrlController = TextEditingController();
      
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Tambah Anime'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextField(
                    controller: descriptionController,
                    decoration: InputDecoration(labelText: 'Deskripsi'),
                  ),
                  TextField(
                    controller: imageUrlController,
                    decoration: InputDecoration(labelText: 'URL Gambar'),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: Text('Batal'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text('Tambah'),
                  onPressed: () {
                    addAnime(
                      nameController.text,
                      descriptionController.text,
                      imageUrlController.text,
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
```


