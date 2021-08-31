import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static SharedPreferences? shared;

  static init() async {
    shared = await SharedPreferences.getInstance();
  }

  static Future puData(key, value) async {
    value is String
        ? await shared!.setString(key, value)
        : value is int
            ? await shared!.setInt(key, value)
            : value is bool
                ? await shared!.setBool(key, value)
                : await shared!.setDouble(key, value);
  }
  static  int? getData(key,) {
    return shared!.getInt(key);
  }
    static  String? getDataS(key,) {
    return shared!.getString(key);
  }
  static  bool? getDataB(key,) {
    return shared!.getBool(key);
  }  static  double? getDataD(key,) {
    return shared!.getDouble(key);
  }
}
