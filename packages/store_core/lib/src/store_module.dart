import 'package:store_core/store_core.dart';

abstract class StoreModule {
  List<GoRoute> getRoutes();

  List<CollectionSchema> getIsarCollections();
}
