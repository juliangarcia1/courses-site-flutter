import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

// Entities: objects that are going to be the
// outcome of the domain
class Article extends Equatable {
  final String name;
  final String content;
  final int id;
  // final Map<String, dynamic> article;

  // const Article({required this.article}) : super();
  const Article({required this.id, required this.name, required this.content}) : super();

  @override
  // List<Object> get props => [name, content];
  // List<Object> get props => [article];
  List<Object> get props => [id, name, content];

  // factory Article.fromJson(Map<String, dynamic> json) {
  //   return Article(json['name'])
  // }
}
