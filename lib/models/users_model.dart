// model class for user
class User {
  final int id;
  final String email;
  final String username;
  final String password;
  final String phone;
  final String firstname;
  final String lastname;
  final String street;
  final String city;
  final String zipcode;
  final String number;
  final String lat;
  final String long;

  User({
    required this.id,
    required this.email,
    required this.username,
    required this.password,
    required this.phone,
    required this.firstname,
    required this.lastname,
    required this.street,
    required this.city,
    required this.zipcode,
    required this.number,
    required this.lat,
    required this.long,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        phone: json['phone'],
        firstname: json['name']['firstname'],
        lastname: json['name']['lastname'],
        street: json['address']['street'],
        city: json['address']['city'],
        zipcode: json['address']['zipcode'],
        number: json['address']['number'].toString(),
        lat: json['address']['geolocation']['lat'],
        long: json['address']['geolocation']['long']);
  }
}
