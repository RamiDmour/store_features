import 'package:onboarding/features/onboarding/data/local_datasource/models/test.dart';
import 'package:store_core/store_core.dart';

abstract class TestRemoteDatasourceBase {
  Future<List<Test>> getTests();
}

class TestLocalDatasource extends TestRemoteDatasourceBase {
  final Isar _isar;

  TestLocalDatasource({required Isar isar}) : _isar = isar;

  @override
  Future<List<Test>> getTests() => _isar.tests.where().findAll();
}
