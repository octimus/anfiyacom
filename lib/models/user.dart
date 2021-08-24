import 'userInfos.dart';

class User {
  String uid;
  String username = "";
  String phoneNumber = "";
  String email = "";
  String adresse = "";
  String pic = "";
  UserType userType;

  User({
    this.uid,
    this.username,
    this.phoneNumber,
    this.email,
    this.adresse,
    this.pic,
    this.userType,
  });
}
