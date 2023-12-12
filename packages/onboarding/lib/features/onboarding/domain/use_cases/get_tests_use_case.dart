import 'package:onboarding/features/onboarding/data/local_datasource/models/test.dart';
import 'package:onboarding/features/onboarding/data/repository/test_repository.dart';

class GetTestsUseCase {
  final TestRepository _testRepository;

  GetTestsUseCase({required TestRepository testRepository})
      : _testRepository = testRepository;

  Future<List<Test>> call() {
    return _testRepository.getTests();
  }
}
