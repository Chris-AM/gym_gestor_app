import 'package:gym_gestor_app/domain/entities/menu_entity.dart';

abstract class HomeDataSource {
  Future<List<MenuEntity>>getMenus();
}