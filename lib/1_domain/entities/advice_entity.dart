import 'package:equatable/equatable.dart';

class AdviceEntity extends Equatable {
  final String advice;
  final int id;

  AdviceEntity({required this.advice, required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [advice, id];
}
