import '../models/user.dart';
import 'package:flutter/cupertino.dart';

enum UserType { driver, client }

class UserProfile extends ChangeNotifier {
  User userProfile;
  dynamic userType;

  UserProfile(this.userProfile, this.userType);
  void updateUserInfo(User user) {
    this.userProfile = user;
    print("updated provider user 😁");
    notifyListeners();
  }

  void updateUserType(UserType type) {
    this.userType = type;
    print("updated provider userType to $type 😁 ");
    notifyListeners();
  }
}
