import 'package:json_annotation/json_annotation.dart';

part 'random_user.g.dart';

@JsonSerializable()
class RandomUser extends Object {
  @JsonKey(name: 'results')
  List<Results> results;

  @JsonKey(name: 'info')
  Info info;

  RandomUser(
    this.results,
    this.info,
  );

  factory RandomUser.fromJson(Map<String, dynamic> srcJson) =>
      _$RandomUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RandomUserToJson(this);
}

@JsonSerializable()
class Results extends Object {
  @JsonKey(name: 'gender')
  String gender;

  @JsonKey(name: 'name')
  Name name;

  @JsonKey(name: 'location')
  Location location;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'login')
  Login login;

  @JsonKey(name: 'dob')
  Dob dob;

  @JsonKey(name: 'registered')
  Registered registered;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'cell')
  String cell;

  @JsonKey(name: 'id')
  Id id;

  @JsonKey(name: 'picture')
  Picture picture;

  @JsonKey(name: 'nat')
  String nat;

  Results(
    this.gender,
    this.name,
    this.location,
    this.email,
    this.login,
    this.dob,
    this.registered,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  );

  factory Results.fromJson(Map<String, dynamic> srcJson) =>
      _$ResultsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Name extends Object {
  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'first')
  String first;

  @JsonKey(name: 'last')
  String last;

  Name(
    this.title,
    this.first,
    this.last,
  );

  factory Name.fromJson(Map<String, dynamic> srcJson) =>
      _$NameFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class Location extends Object {
  @JsonKey(name: 'street')
  Street street;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'postcode')
  int postcode;

  @JsonKey(name: 'coordinates')
  Coordinates coordinates;

  @JsonKey(name: 'timezone')
  Timezone timezone;

  Location(
    this.street,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.coordinates,
    this.timezone,
  );

  factory Location.fromJson(Map<String, dynamic> srcJson) =>
      _$LocationFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Street extends Object {
  @JsonKey(name: 'number')
  int number;

  @JsonKey(name: 'name')
  String name;

  Street(
    this.number,
    this.name,
  );

  factory Street.fromJson(Map<String, dynamic> srcJson) =>
      _$StreetFromJson(srcJson);

  Map<String, dynamic> toJson() => _$StreetToJson(this);
}

@JsonSerializable()
class Coordinates extends Object {
  @JsonKey(name: 'latitude')
  String latitude;

  @JsonKey(name: 'longitude')
  String longitude;

  Coordinates(
    this.latitude,
    this.longitude,
  );

  factory Coordinates.fromJson(Map<String, dynamic> srcJson) =>
      _$CoordinatesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class Timezone extends Object {
  @JsonKey(name: 'offset')
  String offset;

  @JsonKey(name: 'description')
  String description;

  Timezone(
    this.offset,
    this.description,
  );

  factory Timezone.fromJson(Map<String, dynamic> srcJson) =>
      _$TimezoneFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TimezoneToJson(this);
}

@JsonSerializable()
class Login extends Object {
  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'username')
  String username;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'salt')
  String salt;

  @JsonKey(name: 'md5')
  String md5;

  @JsonKey(name: 'sha1')
  String sha1;

  @JsonKey(name: 'sha256')
  String sha256;

  Login(
    this.uuid,
    this.username,
    this.password,
    this.salt,
    this.md5,
    this.sha1,
    this.sha256,
  );

  factory Login.fromJson(Map<String, dynamic> srcJson) =>
      _$LoginFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LoginToJson(this);
}

@JsonSerializable()
class Dob extends Object {
  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'age')
  int age;

  Dob(
    this.date,
    this.age,
  );

  factory Dob.fromJson(Map<String, dynamic> srcJson) => _$DobFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DobToJson(this);
}

@JsonSerializable()
class Registered extends Object {
  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'age')
  int age;

  Registered(
    this.date,
    this.age,
  );

  factory Registered.fromJson(Map<String, dynamic> srcJson) =>
      _$RegisteredFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RegisteredToJson(this);
}

@JsonSerializable()
class Id extends Object {
  @JsonKey(name: 'name')
  String name;

  Id(
    this.name,
  );

  factory Id.fromJson(Map<String, dynamic> srcJson) => _$IdFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IdToJson(this);
}

@JsonSerializable()
class Picture extends Object {
  @JsonKey(name: 'large')
  String large;

  @JsonKey(name: 'medium')
  String medium;

  @JsonKey(name: 'thumbnail')
  String thumbnail;

  Picture(
    this.large,
    this.medium,
    this.thumbnail,
  );

  factory Picture.fromJson(Map<String, dynamic> srcJson) =>
      _$PictureFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PictureToJson(this);
}

@JsonSerializable()
class Info extends Object {
  @JsonKey(name: 'seed')
  String seed;

  @JsonKey(name: 'results')
  int results;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'version')
  String version;

  Info(
    this.seed,
    this.results,
    this.page,
    this.version,
  );

  factory Info.fromJson(Map<String, dynamic> srcJson) =>
      _$InfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$InfoToJson(this);
}
