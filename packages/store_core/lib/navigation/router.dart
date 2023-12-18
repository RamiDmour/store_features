import 'package:flutter/material.dart';
import 'package:store_core/navigation/bottom_navigation_page.dart';
import 'package:store_core/store_core.dart';

GoRouter getRouter({
  List<StoreModule> modules = const [],
  required GoRouter Function(List<RouteBase>) routerBuilder,
}) {
  final routes = modules.fold<List<RouteBase>>(
    [],
    (accum, module) => [
      ...accum,
      ...module.getRoutes(),
    ],
  ).toList();

  final branches = modules.fold(
    <StatefulShellBranch>[],
    (accum, module) => [
      ...accum,
      ...module.getShellBranches(),
    ],
  );
  if (branches.isNotEmpty) {
    routes.add(
      StatefulShellRoute.indexedStack(
        branches: branches,
        pageBuilder: (context, state, navigationShell) => MaterialPage(
          child: BottomNavigationPage(child: navigationShell),
        ),
      ),
    );
  }

  return routerBuilder(routes);
}
