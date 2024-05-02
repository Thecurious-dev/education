import 'package:education/core/usecase/usecase.dart';
import 'package:education/core/utils/typedef.dart';
import 'package:education/src/authentication/domain/repositories/authentication_repository.dart';

class ForgotPassword extends UsecaseWithParams<void, String> {
  const ForgotPassword(this._repo);

  final AuthRepo _repo;

  @override
  ResultFuture<void> call(String params) => _repo.forgotPassword(params);
}
