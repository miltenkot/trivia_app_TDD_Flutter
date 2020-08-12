import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:triviaapp/core/error/failures.dart';
import 'package:triviaapp/core/usecases/usecase.dart';
import 'package:triviaapp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:triviaapp/features/number_trivia/domain/repositories/number_trivia_repositories.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }

}

class NoParams extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}