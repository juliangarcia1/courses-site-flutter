import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show listEquals;
import '../../domain/models/quiz_model.dart';

class QuizSummary extends StatelessWidget {
  final QuizModel quiz;
  final Map<int, dynamic> userAnswers;

  const QuizSummary({
    Key? key,
    required this.quiz,
    required this.userAnswers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quiz.questions.length,
      itemBuilder: (context, index) {
        final question = quiz.questions[index];
        final userAnswer = userAnswers[index];
        final isCorrect = _isAnswerCorrect(question, userAnswer);

        return Card(
          margin: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Question ${index + 1}: ${question.text}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildAnswerWidget(question, userAnswer, isCorrect),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAnswerWidget(QuestionModel question, dynamic userAnswer, bool isCorrect) {
    if (userAnswer == null) {
      return const Text(
        'Not answered',
        style: TextStyle(color: Colors.grey),
      );
    }

    switch (question.type) {
      case 'multiple_choice':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < question.options.length; i++)
              Text(
                question.options[i],
                style: TextStyle(
                  color: _getAnswerColor(question, userAnswer, i),
                ),
              ),
            if (!isCorrect) ...[
              const SizedBox(height: 8),
              const Text(
                'Correct answers:',
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ...question.correctAnswer.map<Widget>((index) => Text(
                    question.options[index],
                    style: const TextStyle(color: Colors.green),
                  )),
            ],
          ],
        );
      case 'true_false':
      case 'yes_no':
        return Text(
          'Your answer: $userAnswer',
          style: TextStyle(
            color: isCorrect ? Colors.green : Colors.red,
          ),
        );
      case 'fill_the_blank':
      case 'fill_multiple_blanks':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your answer: $userAnswer',
              style: TextStyle(
                color: isCorrect ? Colors.green : Colors.red,
              ),
            ),
            if (!isCorrect) Text(
              'Correct answer: ${question.correctAnswer}',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        );
      default:
        return const Text('Unknown question type');
    }
  }

  Color _getAnswerColor(QuestionModel question, dynamic userAnswer, int index) {
    if (userAnswer == null || question.type != 'multiple_choice') {
      return Colors.black;
    }

    final List<bool> answers = userAnswer as List<bool>;
    final isCorrectOption = (question.correctAnswer as List).contains(index);
    final wasSelected = answers[index];

    if (isCorrectOption && wasSelected) return Colors.green;
    if (!isCorrectOption && wasSelected) return Colors.red;
    if (isCorrectOption && !wasSelected) return Colors.red; // Highlight missed correct answers
    return Colors.black;
  }

  bool _isAnswerCorrect(QuestionModel question, dynamic userAnswer) {
    if (userAnswer == null) return false;

    switch (question.type) {
      case 'multiple_choice':
        try {
          final correctAnswers = question.correctAnswer as List;
          final userSelected = userAnswer as List<bool>;
          
          // Check if all correct answers are selected
          for (var i = 0; i < userSelected.length; i++) {
            final isCorrect = correctAnswers.contains(i);
            if (isCorrect && !userSelected[i]) {
              return false; // Failed if any correct answer is not selected
            }
            if (!isCorrect && userSelected[i]) {
              return false; // Failed if any wrong answer is selected
            }
          }
          return true; // All correct answers selected and no wrong ones
        } catch (e) {
          return false;
        }
      case 'true_false':
      case 'yes_no':
        return userAnswer == question.correctAnswer;
      case 'fill_the_blank':
      case 'fill_multiple_blanks':
        return userAnswer.toString().toLowerCase() == 
               question.correctAnswer.toString().toLowerCase();
      default:
        return false;
    }
  }
}