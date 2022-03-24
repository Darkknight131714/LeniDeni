import 'package:flutter/material.dart';
import 'package:lenideni/functions.dart';
import 'home.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String email = "", pass = "", name = "", mobile = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LeniDeni"),
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(hintText: 'Email'),
            onChanged: (value) {
              email = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            decoration: InputDecoration(hintText: 'Password'),
            onChanged: (value) {
              pass = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.name,
            decoration: InputDecoration(hintText: 'Name'),
            onChanged: (value) {
              name = value;
            },
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: 'Mobile'),
            onChanged: (value) {
              mobile = value;
            },
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              Functions func = Functions();
              bool val = await func.RegisterUser(email, pass, name, mobile);
              if (val) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen(
                        email: email,
                        name: name,
                        mobile: mobile,
                      );
                    },
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Something's Wrong I can feel it"),
                  ),
                );
              }
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
