import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData extends ChangeNotifier {
  List<Map<String, String>> users = [];

  UserData() {
    _loadUserData();
  }

  void updateUserData(String newUsername, String newPassword) {
    users.add({'username': newUsername, 'password': newPassword});

    _saveUserData();
    notifyListeners();
  }

  Future<void> _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(
      'users',
      users.map((user) => '${user['username']}:${user['password']}').toList(),
    );
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? userDataString = prefs.getStringList('users');

    if (userDataString != null) {
      users = userDataString.map((userString) {
        List<String> userData = userString.split(':');
        return {'username': userData[0], 'password': userData[1]};
      }).toList();
    }
    notifyListeners();
  }
}
