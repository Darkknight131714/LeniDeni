import 'package:flutter/cupertino.dart';

class UserC extends ChangeNotifier {
  String name, email, mobile;
  UserC({required this.name, required this.email, required this.mobile});
}
