import 'package:gym_gestor_app/domain/entities/menu_entity.dart';

class MenuMapper {
  static MenuEntity fromJsonList(Map<String, dynamic> json) => MenuEntity(
        name: json['name'],
        description: json['description'],
        icon: json['icon'],
        image: json['image'],
        url: json['url'],
      );
}
