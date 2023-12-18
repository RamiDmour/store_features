import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:store_core/interfaces/store_module.dart';

Future<Isar?> getIsar(List<StoreModule> modules) async {
  final dir = await getApplicationDocumentsDirectory();
  final directory = dir.path;
  final schemas = modules.fold<List<CollectionSchema>>(
    [],
    (accum, module) => [
      ...accum,
      ...module.getIsarCollections(),
    ],
  ).toList();

  return schemas.isEmpty
      ? null
      : await Isar.open(schemas, directory: directory);
}
