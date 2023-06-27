import 'package:api_flutter_working/model/user_dob.dart';
import 'package:api_flutter_working/model/user_location.dart';
import 'package:api_flutter_working/model/user_picture.dart';

import 'user_name.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  final UserPicture pic;

  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.pic,
  });

// basically this is a getter
  String getFUllName() {
    return "${name.title} ${name.first} s${name.last}";
  }
}
