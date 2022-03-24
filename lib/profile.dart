import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'prov.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Text("Name: ${Provider.of<UserC>(context).name}"),
          Text("Email: ${Provider.of<UserC>(context).email}"),
          Text("Mobile: ${Provider.of<UserC>(context).mobile}"),
        ],
      ),
    );
  }
}
