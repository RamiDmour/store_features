import 'package:store_core/store_core.dart';

abstract class StoreModule {
  List<RouteBase> getRoutes();

  List<StatefulShellBranch> getShellBranches() => [];

  List<CollectionSchema> getIsarCollections();
}
