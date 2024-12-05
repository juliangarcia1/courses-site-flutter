
class QuizModel {
  final String title;
  final List<QuestionModel> questions;

  QuizModel({required this.title, required this.questions});

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      title: json['title'],
      questions: (json['questions'] as List)
          .map((q) => QuestionModel.fromJson(q))
          .toList(),
    );
  }
}

class QuestionModel {
  final String type;
  final String text;
  final List<dynamic> options;
  final dynamic correctAnswer;

  QuestionModel({
    required this.type,
    required this.text,
    required this.options,
    required this.correctAnswer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      type: json['type'],
      text: json['text'],
      options: json['options'] ?? [],
      correctAnswer: json['correctAnswer'],
    );
  }
}