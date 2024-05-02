import 'package:education/core/usecase/usecase.dart';
import 'package:education/core/utils/typedef.dart';
import 'package:education/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CacheFirstTimer extends UsecaseWithoutParams<void> {
  const CacheFirstTimer(this._repo);
  final OnBoardingRepo _repo;

  @override
  ResultFuture<void> call() async => _repo.cacheFirstTimer();
}
