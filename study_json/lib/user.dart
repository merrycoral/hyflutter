import 'package:json_annotation/json_annotation.dart';

import 'address.dart';
part 'user.g.dart';

@JsonSerializable()
class User{
  final String name;
  final String email;
  @JsonKey(name: 'created_time')
  final int createdTime;
  final Address address;

  User(this.name, this.email, this.createdTime, this.address);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /*
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        createdTime = json['created_time'];
  */

  Map<String, dynamic> toJson() =>
      _$UserToJson(this);
  /*
      {
        'name' : name,
        'email' : email,
        'created_time' : createdTime,
      };

   */
}
