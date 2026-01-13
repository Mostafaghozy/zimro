import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize cache
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save data
  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    } else if (value is String) {
      return await sharedPreferences.setString(key, value);
    } else if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else if (value is double) {
      return await sharedPreferences.setDouble(key, value);
    } else {
      return false;
    }
  }

  //! Get data
  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Get String only
  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  //! Remove data
  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Clear all cache
  static Future<bool> clear() async {
    return await sharedPreferences.clear();
  }

  //! ================= TOKEN =================
  static Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  static String? getToken() {
    return sharedPreferences.getString('token');
  }
}
