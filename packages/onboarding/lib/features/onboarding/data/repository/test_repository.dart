import 'package:onboarding/features/onboarding/data/local_datasource/models/test.dart';
import 'package:onboarding/features/onboarding/data/local_datasource/test_local_datasource.dart';

abstract class TestRepositoryBase {
  Future<List<Test>> getTests();
}

class TestRepository extends TestRepositoryBase {
  final TestLocalDatasource _testLocalDatasource;

  TestRepository({required TestLocalDatasource testLocalDatasource})
      : _testLocalDatasource = testLocalDatasource;

  @override
  Future<List<Test>> getTests() {
    return _testLocalDatasource.getTests();
  }
}
