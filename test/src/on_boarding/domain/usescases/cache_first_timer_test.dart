import 'package:dartz/dartz.dart';
import 'package:education/core/errors/failure.dart';
import 'package:education/src/on_boarding/domain/repos/on_boarding_repo.dart';
import 'package:education/src/on_boarding/domain/usescases/cache_first_timer.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'on_boarding_repo_mock.dart';

void main() {
  late OnBoardingRepo repo;
  late CacheFirstTimer usecase;

  setUp(() {
    repo = MockOnBoardingRepo();
    usecase = CacheFirstTimer(repo);
  });

  test(
      'should call the [onBoardingRepo.cacheFirstTimer and return the right data]',
      () async {
    when(() => repo.cacheFirstTimer()).thenAnswer(
      (_) async => Left(
        ServerFailure(message: 'Unknown Error Occured', statusCode: 500),
      ),
    );

    final result = await usecase();

    expect(
      result,
      equals(
        Left<Failure, dynamic>(
          ServerFailure(message: 'Unknown Error Occured', statusCode: 500),
        ),
      ),
    );
    verify(() => repo.cacheFirstTimer()).called(1);
    verifyNoMoreInteractions(repo);
  });
}
