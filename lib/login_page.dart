import 'package:flutter/material.dart';
import 'package:pertemuan3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  _showInput(namaController, placeholder, isPassword){
    return FadeTransition(
      opacity: _animation,
      child: TextField(
        controller: namaController,
        obscureText: isPassword,
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          hintText: placeholder,
          hintStyle: const TextStyle(
            color: Colors.white70,
          ),
          filled: true,
          fillColor: Colors.black54,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }

  _showDialog(pesan, alamat) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesan),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => alamat,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/bg_login.png'), // Background image
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 8,
            color: Colors.white.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _animation,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'AnimeFont',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  _showInput(_usernameController, 'Masukkan Username', false),
                  const SizedBox(height: 20),
                  _showInput(_passwordController, 'Masukkan Password', true),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_usernameController.text == 'admin' &&
                          _passwordController.text == 'admin') {
                        _saveUsername();
                        _showDialog('Anda Berhasil Login', const HomePage());
                      } else {
                        _showDialog('Username dan Password Salah', const LoginPage());
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
