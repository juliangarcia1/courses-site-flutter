
import 'dart:ffi';

import 'package:coursessite/features/articles/domain/repositories/article_persistence.dart';
import 'package:either_dart/src/either.dart';

import 'package:coursessite/core/error/failures.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecases.dart';
import '../entities/article.dart';

class GetArticle implements UseCase<Article, Params> {
  final ArticleRepository repository;
  
  GetArticle(this.repository);

  @override
  Future<Either<Failure, Article>> call(params) async {
    // throw UnimplementedError();
    return await repository.getArticle(params.id);
  }

}

class Params extends Equatable{
  final String name;
  final int id;

  const Params(this.name, this.id);

  @override
  List<Object> get props => [name, id];
}