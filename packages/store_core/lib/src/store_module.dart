import 'package:store_core/store_core.dart';

abstract interface class StoreModule {
  List<GoRoute> getRoutes();

  List<CollectionSchema> getIsarCollections();
}
