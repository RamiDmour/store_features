library store_core;

import 'package:path_provider/path_provider.dart';
import 'package:store_core/store_core.dart';
export 'package:isar/isar.dart';
export 'package:go_router/go_router.dart';
export 'package:store_core/src/store_di.dart';
export 'package:store_core/src/store_module.dart';

class StoreCore {
  late final GoRouter router;
  late final Isar? isar;

  StoreCore._({
    required this.router,
    required this.isar,
  });

  static Future<StoreCore> create({
    List<StoreModule> modules = const [],
    required GoRouter Function(List<GoRoute> routes) routerBuilder,
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

    final routes = modules.fold<List<GoRoute>>(
      [],
      (accum, module) => [
        ...accum,
        ...module.getRoutes(),
      ],
    ).toList();
    final router = routerBuilder(routes);

    return StoreCore._(
      router: router,
      isar: isar,
    );
  }
}
