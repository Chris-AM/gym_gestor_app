import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/features/auth/presentation/providers/auth_provider.dart';
import '/features/auth/presentation/screens/screens.dart';
import '/features/home/presentation/screens/screens.dart';

import 'app_router_notifier.dart';

final appRouterProvider = Provider((ref) {
  final goRouterNotifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
      initialLocation: '/splash',
      refreshListenable: goRouterNotifier,
      routes: [
        GoRoute(
          path: '/splash',
          builder: (context, state) => const CheckAuthStatusScreens(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: '/home/:screenIndex',
          builder: (context, state) {
            final String screenIndex =
                state.pathParameters['screenIndex'] ?? '0';
            return HomeScreen(
              screenIndex: int.parse(screenIndex),
            );
          },
        ),
      ],
      redirect: (context, state) {
        final isGoingTo = state.matchedLocation;
        final authStatus = goRouterNotifier.authStatus;

        if (isGoingTo == '/splash' && authStatus == AuthStatus.checking) {
          return null;
        }

        if (authStatus == AuthStatus.unauthenticated) {
          if (isGoingTo == '/login') return null;
          return '/login';
        }

        if (authStatus == AuthStatus.authenticated) {
          if (isGoingTo == '/login' || isGoingTo == '/splash') {
            return '/home/0';
          }
        }
        return null;
      });
});
