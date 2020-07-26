import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:triviaapp/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:triviaapp/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:triviaapp/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository{}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

    setUp(() {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
    });

    final tNumber = 1;
    final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

   test('should get trivia number from the repository',
         () async{
            when(mockNumberTriviaRepository.getConcreteNumberTrivia(any)).thenAnswer((_) async => Right(tNumberTrivia));
            final result = await usecase.execute(number: tNumber);
            expect(result, Right(tNumberTrivia));
            verify(mockNumberTriviaRepository.getConcreteNumberTrivia(tNumber));
            verifyNoMoreInteractions(mockNumberTriviaRepository);
   },);
}
