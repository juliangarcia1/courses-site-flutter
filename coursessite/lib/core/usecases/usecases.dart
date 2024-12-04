

// import 'package:coursessite/features/articles/domain/entities/article.dart';
import 'package:either_dart/either.dart';

import '../error/failures.dart';


abstract class UseCase<Type, Params>{
  Future<Either<Failure, Type>> call(Params params);
}