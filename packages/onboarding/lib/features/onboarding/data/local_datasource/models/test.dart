import 'package:store_core/store_core.dart';

part 'test.g.dart';

@collection
class Test {
  Id id = Isar.autoIncrement;
  String name = '';
}
