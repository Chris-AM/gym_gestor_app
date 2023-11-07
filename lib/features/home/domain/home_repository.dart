import 'package:gym_gestor_app/domain/entities/menu_entity.dart';

abstract class HomeRepository {
  Future<List<MenuEntity>>getMenus();
}