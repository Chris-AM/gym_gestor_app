import 'package:gym_gestor_app/domain/entities/menu_entity.dart';
import 'package:gym_gestor_app/features/home/domain/domain.dart';
import 'package:gym_gestor_app/features/home/infrastructure/home_datasource_impl.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeDataSource _dataSource;

  HomeRepositoryImpl({HomeDataSource? dataSource})
      : _dataSource = dataSource ?? HomeDatasourceImpl();

  @override
  Future<List<MenuEntity>> getMenus() {
    return _dataSource.getMenus();
  }
}
