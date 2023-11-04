import 'package:gym_gestor_app/domain/domain.dart';

class UserMapper {
  static UserEntity userJsonToEntity(Map<String, dynamic> json) => UserEntity(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        avatar: json['avatar'],
        password: json['password'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        isActive: json['isActive'],
        type: json['type'],
        roles: List<String>.from(json['roles'].map((role) => role)),
        token: json['token'],
      );
}
