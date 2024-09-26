import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pertemuan3/about_page.dart';
import 'package:pertemuan3/home_page.dart';
import 'package:pertemuan3/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  _SidemenuState createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  String? _username;

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username');
    });
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginPage()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[900],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(_username ?? 'Guest'),
              accountEmail: const Text('user@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.white),
              title: const Text('Home', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.info, color: Colors.white),
              title: const Text('About', style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AboutPage(),
                  ),
                );
              },
            ),
            const Divider(color: Colors.white54),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.white),
              title: const Text('Logout', style: TextStyle(color: Colors.white)),
              onTap: () {
                _logout(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}