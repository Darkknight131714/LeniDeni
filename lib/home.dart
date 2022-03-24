import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'prov.dart';
import 'profile.dart';

List<Widget> screen = [
  ServicePage(),
  ProfilePage(),
];

class HomeScreen extends StatefulWidget {
  String email, mobile, name;
  HomeScreen({required this.email, required this.mobile, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int curr = 0;
  PageController _pageController = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: curr);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserC>(
      create: (context) {
        return UserC(
            name: widget.name, email: widget.email, mobile: widget.mobile);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("LeniDeni"),
          actions: [
            IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context);
              },
              icon: Icon(Icons.logout_outlined),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_laundry_service_rounded,
                  color: curr == 0 ? Colors.lime : Colors.grey,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: curr == 1 ? Colors.lime : Colors.grey,
                ),
                label: 'Profile'),
          ],
          currentIndex: curr,
          selectedItemColor: Colors.white,
          onTap: (index) {
            setState(() {
              curr = index;
            });
          },
        ),
        body: PageView(
          children: screen,
          onPageChanged: (index) {
            setState(() {
              curr = index;
            });
          },
        ),
      ),
    );
  }
}

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Home"),
    );
  }
}
