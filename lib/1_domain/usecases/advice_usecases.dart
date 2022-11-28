import 'package:adviser/1_domain/entities/advice_entity.dart';

class AdviceUseCases {
  Future<AdviceEntity> getAdvice() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    return AdviceEntity(advice: 'advice to test', id: 1);
  }
}
