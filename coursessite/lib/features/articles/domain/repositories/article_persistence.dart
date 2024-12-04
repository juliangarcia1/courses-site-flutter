import 'package:coursessite/core/error/failures.dart';
import 'package:coursessite/features/articles/domain/entities/article.dart';
import 'package:either_dart/either.dart';

abstract class ArticleRepository {
  Future<Either<Failure, Article>> getArticle(int id);
}