import 'package:go_router/go_router.dart';
import 'package:gym_gestor_app/presentation/screens/home_screen.dart';

final appRouter = GoRouter(initialLocation: '/home/0', routes: [
  GoRoute(
      path: '/home/:screenIndex',
      builder: (context, state) {
        final String screenIndex = state.pathParameters['screenIndex'] ?? '0';
        return HomeScreen(
          screenIndex: int.parse(screenIndex),
        );
      }),
]);
