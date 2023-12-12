library store_core;

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_core/navigation/bottom_navigation_page.dart';
import 'package:store_core/store_core.dart';

export 'package:isar/isar.dart';
export 'package:go_router/go_router.dart';
export 'package:store_core/di/store_di.dart';
export 'package:store_core/interfaces/store_module.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:store_core/constants/store_colors.dart';

class StoreCore {
  late final GoRouter router;
  late final Isar? isar;

  StoreCore._({
    required this.router,
    required this.isar,
  });

  static Future<StoreCore> create({
    List<StoreModule> modules = const [],
    required GoRouter Function(List<RouteBase> routes) routerBuilder,
  }) async {
    final dir = await getApplicationDocumentsDirectory();
    final directory = dir.path;
    final schemas = modules.fold<List<CollectionSchema>>(
      [],
      (accum, module) => [
        ...accum,
        ...module.getIsarCollections(),
      ],
    ).toList();
    final isar =
        schemas.isEmpty ? null : await Isar.open(schemas, directory: directory);

    final routes = modules.fold<List<RouteBase>>(
      [],
      (accum, module) => [
        ...accum,
        ...module.getRoutes(),
      ],
    ).toList();

    routes.add(
      StatefulShellRoute.indexedStack(
        branches: modules.fold(
          [],
          (accum, module) => [
            ...accum,
            ...module.getShellBranches(),
          ],
        ),
        pageBuilder: (context, state, navigationShell) => MaterialPage(
          child: BottomNavigationPage(child: navigationShell),
        ),
      ),
    );

    final router = routerBuilder(routes);

    return StoreCore._(
      router: router,
      isar: isar,
    );
  }
}

Future<void> runStoreApp({
  List<StoreModule> modules = const [],
  required GoRouter Function(List<RouteBase>) routerBuilder,
  required Widget app,
}) async {
  await initDI(routerBuilder: routerBuilder, modules: modules);

  runApp(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) => child!,
      child: app,
    ),
  );
}
