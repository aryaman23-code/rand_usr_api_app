import 'dart:ui';

import 'package:api_flutter_working/model/user_dob.dart';
import 'package:api_flutter_working/model/user_location.dart';

import 'package:http/http.dart' as http;
import 'package:api_flutter_working/model/user.dart';
import 'package:api_flutter_working/model/user_name.dart';
import 'package:api_flutter_working/model/user_picture.dart';
import 'dart:convert';

class UserApi {
  static Future<List<User>> fetchusers() async {
    //TODO; try this format in the weather app api applicatoin

    const url = 'https://randomuser.me/api/?results=18';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    Map json = jsonDecode(body);
    // print(json);
    final results = json["results"] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );
      final dob = UserDob(
        date: DateTime.parse(e['dob']['date']),
        age: e['dob']['age'],
      );
      final coordinates = LocationCoordinates(
          latitudes: e['location']['coordinates']['latitude'],
          longitudes: e['location']['coordinates']['longitude']);
      final timezone = Timezones(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']);

      final street = Streets(
          name: e['location']['street']['name'],
          number: e['location']['street']['number']);
      final pic = UserPicture(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']);

      final location = UserLocation(
        city: e['location']['city'],
        state: e['location']['state'],
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        coordinates: coordinates,
        timezone: timezone,
        street: street,
      );

      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
        pic: pic,
      );
    }).toList();
    return users;
  }
}
