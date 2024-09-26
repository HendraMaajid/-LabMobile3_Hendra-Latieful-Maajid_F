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


## Fitur Penambahan Anime


README ini menjelaskan fitur penambahan anime, yang terdiri dari dua fungsi utama: `_addAnime()` dan `_showAddAnimeDialog()`.

### 1. `_addAnime()`

```dart
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
```

### Penjelasan:

- Fungsi ini bertanggung jawab untuk menambahkan anime baru ke `animeList`.
- Pertama-tama, fungsi ini memeriksa apakah semua kolom input (nama, deskripsi, dan URL gambar) tidak kosong.
- Jika semua kolom terisi:
   1. Menggunakan `setState()` untuk memperbarui status aplikasi.
   2. Entri anime baru ditambahkan ke `animeList` sebagai map dengan kunci 'name', 'description', dan 'image'.
   3. Semua controller teks dibersihkan untuk mereset kolom input.
   4. Dialog ditutup menggunakan `Navigator.of(context).pop()`.

### 2. `_showAddAnimeDialog()`

```dart
void _showAddAnimeDialog() {
   showDialog(
      context: context,
      builder: (BuildContext context) {
         return AlertDialog(
            title: const Text('Tambah Anime'),
            content: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                  TextField(
                     controller: _nameController,
                     decoration: const InputDecoration(labelText: 'Nama Anime'),
                  ),
                  TextField(
                     controller: _descriptionController,
                     decoration: const InputDecoration(labelText: 'Deskripsi'),
                  ),
                  TextField(
                     controller: _imageUrlController,
                     decoration: const InputDecoration(labelText: 'URL Gambar'),
                  ),
               ],
            ),
            actions: [
               TextButton(
                  onPressed: () {
                     _addAnime();
                  },
                  child: const Text('Tambah'),
               ),
               TextButton(
                  onPressed: () {
                     Navigator.of(context).pop();
                  },
                  child: const Text('Batal'),
               ),
            ],
         );
      },
   );
}
```

### Penjelasan:

- Fungsi ini membuat dan menampilkan dialog untuk menambahkan anime baru.
- Menggunakan fungsi `showDialog()` Flutter untuk menampilkan `AlertDialog`.
- Dialog tersebut berisi:
   1. Judul: "Tambah Anime"
   2. Konten: Tiga widget `TextField` untuk memasukkan detail anime:
      - Nama Anime (dikontrol oleh `_nameController`)
      - Deskripsi (dikontrol oleh `_descriptionController`)
      - URL Gambar (dikontrol oleh `_imageUrlController`)
   3. Dua tombol aksi:
      - "Tambah": Memanggil fungsi `_addAnime()` saat ditekan
      - "Batal": Menutup dialog tanpa menambahkan anime

### Penggunaan:

Fungsi ini biasanya dipanggil ketika pengguna ingin menambahkan anime baru, misalnya saat menekan tombol "Tambah" di antarmuka utama aplikasi.

## Demo
<img src="demo.gif" alt="Demo Fitur Penambahan Anime" width="300"/>






