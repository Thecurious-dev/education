import 'package:education/core/usecase/usecase.dart';
import 'package:education/core/utils/typedef.dart';
import 'package:education/src/on_boarding/domain/repos/on_boarding_repo.dart';

class CheckIfUserIsFirstTimer extends UsecaseWithoutParams<bool> {
  const CheckIfUserIsFirstTimer(this._repo);
  final OnBoardingRepo _repo;

  @override
  ResultFuture<bool> call() async => _repo.checkIfUserIsFirstTimer();
}
