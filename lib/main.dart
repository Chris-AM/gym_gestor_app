import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gym_gestor_app/config/config.dart';

Future<void> main() async {}

class GymGestor extends ConsumerWidget {
  const GymGestor({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalAppTheme globalAppTheme = ref.watch(globalAppThemeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Gym Gestor',
      theme: globalAppTheme.getTheme(),
      routerConfig: appRouter,
    );
  }
}
