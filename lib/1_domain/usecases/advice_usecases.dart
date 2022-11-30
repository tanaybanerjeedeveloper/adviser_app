import 'package:adviser/1_domain/entities/advice_entity.dart';
import 'package:dartz/dartz.dart';

import '../failures/advice_failures.dart';

class AdviceUseCases {
  Future<Either<Failure, AdviceEntity>> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    //return right(AdviceEntity(advice: 'advice to test', id: 1));
    return left(CacheError());
  }
}
