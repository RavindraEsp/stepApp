import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Preference {
  static SharedPreferences? _pref;

  Future<SharedPreferences?> instance() async {
    if (_pref != null) return _pref;
    await SharedPreferences.getInstance().then((onValue) {
      _pref = onValue;
    }).catchError((onError) {
      _pref = null;
    });
    return _pref;
  }


  static const String _accessToken = "accessToken";
  static const String _userImage = "userImage";
  static const String _isWalking = "_isWalking";





  static setAccessToken(String value) async {
    _pref?.setString(_accessToken, value);
  }

  String getAccessToken() {
    return _pref?.getString(_accessToken) ?? "";
  }

  static setUserImage(String value) async {
    _pref?.setString(_userImage, value);
  }

  String getUserImage() {
    return _pref?.getString(_userImage) ?? "";
  }

  static setWalking(bool value) async {
    _pref?.setBool(_isWalking, value);
  }

  bool getWalking() {
    return _pref?.getBool(_isWalking) ?? false;
  }




  clearSharedPreference() {
    _pref?.clear();
  }
}
