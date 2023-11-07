import 'package:flutter/material.dart';

import '/domain/domain.dart';
import '/features/home/domain/domain.dart';

class HomeDatasourceImpl extends HomeDataSource {
  final _routineMenu = MenuEntity(
    name: 'Rutinas',
    description: 'Lista de rutinas',
    image:
        'https://womensfitness.co.uk/wp-content/uploads/sites/3/2023/01/shutterstock_587832047.jpg?w=900',
    icon: Icons.abc,
    url: '/routines',
  );

  @override
  Future<List<MenuEntity>> getMenus() {
    return Future.delayed(
      Duration(seconds: 1),
      () => [_routineMenu],
    );
  }
}
