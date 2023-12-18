library store_core;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_core/isar/isar.dart';
import 'package:store_core/navigation/router.dart';
import 'package:store_core/store_core.dart';

export 'package:isar/isar.dart';
export 'package:go_router/go_router.dart';
export 'package:store_core/di/store_di.dart';
export 'package:store_core/interfaces/store_module.dart';
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:store_core/constants/store_colors.dart';
export 'package:store_core/api/api_client.dart';
export 'package:flutter_bloc/flutter_bloc.dart';

class StoreCore {
  late final GoRouter router;
  late final Isar? isar;
  late final ApiClient apiClient;
  StoreCore._({
    required this.router,
    required this.isar,
    required this.apiClient,
  });

  static Future<StoreCore> create({
    List<StoreModule> modules = const [],
    required GoRouter Function(List<RouteBase> routes) routerBuilder,
    ApiClient? apiClient,
  }) async {
    final isar = await getIsar(modules);
    final router = getRouter(
      routerBuilder: routerBuilder,
      modules: modules,
    );

    return StoreCore._(
      router: router,
      isar: isar,
      apiClient: apiClient ?? ApiClient.fromDio(Dio()),
    );
  }
}

Future<void> runStoreApp({
  List<StoreModule> modules = const [],
  required GoRouter Function(List<RouteBase>) routerBuilder,
  required Widget app,
}) async {
  await initDI(
    routerBuilder: routerBuilder,
    modules: modules,
  );

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
