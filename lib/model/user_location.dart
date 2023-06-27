class UserLocation{
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCoordinates coordinates; 
  final Timezones timezone;
  final Streets street;
  UserLocation({
    required this.city, 
    required this.state, 
    required this.country, 
    required this.postcode, 
    required this.coordinates,
    required this.timezone,
    required this.street,
  });
}


class Streets{
  final int number ; 
  final String name ;
  Streets({
    required this.name,
    required this.number

  });
}

class LocationCoordinates{
  final String latitudes; 
  final String longitudes;
  LocationCoordinates({
    required this.latitudes, 
    required this.longitudes
  });

}

class Timezones{
  final String offset ; 
  final String description ; 
  Timezones({
    required this.offset, 
    required this.description 
  });

}