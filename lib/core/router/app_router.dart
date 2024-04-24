import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:palli_application/presentation/auth/pages/auth_page.dart';
import 'package:palli_application/presentation/dashbord/pages/dashboard_page.dart';
import 'package:palli_application/presentation/home/pages/home_page.dart';
import 'package:palli_application/presentation/users/pages/users_page.dart';

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/auth',
  routes: [
    GoRoute(
      path: '/auth',
      builder: (context, state) {
        return const AuthPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return DashBoardPage(child: child);
      },
      routes: [
        // This screen is displayed on the ShellRoute's Navigator.

        GoRoute(
          path: '/dashboard',
          builder: (context, state) {
            return const HomePage();
          },
          routes: const <RouteBase>[
            // This screen is displayed on the ShellRoute's Navigator.
            // GoRoute(
            //   path: 'details',
            //   builder: (BuildContext context, GoRouterState state) {
            //     return const DetailsScreen(label: 'A');
            //   },
            // ),
          ],
        ),
        // Displayed ShellRoute's Navigator.
        GoRoute(
          path: '/users',
          builder: (BuildContext context, GoRouterState state) {
            return const UsersPage();
          },
          routes: <RouteBase>[
            // Displayed on the root Navigator by specifying the
            // [parentNavigatorKey].
            GoRoute(
              path: 'details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (BuildContext context, GoRouterState state) {
                return const DetailsScreen(label: 'B');
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

/// The details screen for either the A, B or C screen.
class DetailsScreen extends StatelessWidget {
  /// The label to display in the center of the screen.
  final String label;

  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
      ),
      body: Center(
        child: Text(
          'Details for $label',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
