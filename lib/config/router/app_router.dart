import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gallery_app/presentation/views/views.dart';
import 'package:gallery_app/presentation/screens/scaffold_with_nested_navigation.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shell1NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell1');
final _shell2NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell2');
final _shell3NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell3');
final _shell4NavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell4');

final appRouter = GoRouter(
  // Define la ubicación inicial
  initialLocation: "/inicio",
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(
          key: state.pageKey,
          navigationShell: navigationShell,
        );
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shell1NavigatorKey,
          routes: [
            GoRoute(
              path: "/inicio",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const HomeView(),
                );
              },
              routes: [
                GoRoute(
                  path: "image",
                  pageBuilder: (context, state) {
                    String imageUrl = state.extra as String;
                    return NoTransitionPage(
                      key: state.pageKey,
                      child: ImageView(imageUrl: imageUrl),
                    );
                  },
                )
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shell2NavigatorKey,
          routes: [
            GoRoute(
              path: "/configuration",
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  key: state.pageKey,
                  child: const ConfigurationView(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shell3NavigatorKey,
          routes: [
            GoRoute(
              path: "/favorites",
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: FavoritesView(),
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shell4NavigatorKey,
          routes: [
            GoRoute(
              path: "/shared",
              pageBuilder: (context, state) {
                return const NoTransitionPage(
                  child: SharedView(),
                );
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
