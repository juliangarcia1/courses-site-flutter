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

  int _calculateScore() {
    int correctAnswers = 0;
    for (var i = 0; i < quiz.questions.length; i++) {
      if (_isAnswerCorrect(quiz.questions[i], userAnswers[i])) {
        correctAnswers++;
      }
    }
    return correctAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final score = _calculateScore();
    final totalQuestions = quiz.questions.length;
    final percentage = (score / totalQuestions * 100).round();

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16.0),
          color: Colors.grey.shade100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Score: $score/$totalQuestions ($percentage%)',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
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
          ),
        ),
      ],
    );
  }

  Widget _buildAnswerWidget(QuestionModel currentQuestion, dynamic userAnswer, bool isCorrect) {
    if (userAnswer == null) {
      return const Text(
        'Not answered',
        style: TextStyle(color: Colors.grey),
      );
    }

    switch (currentQuestion.type) {
      case 'multiple_choice':
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < currentQuestion.options.length; i++)
              Text(
                currentQuestion.options[i],
                style: TextStyle(
                  color: _getAnswerColor(currentQuestion, userAnswer, i),
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
              ...currentQuestion.correctAnswer.map<Widget>((index) => Text(
                    currentQuestion.options[index],
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
              'Correct answer: ${currentQuestion.correctAnswer}',
              style: const TextStyle(color: Colors.green),
            ),
          ],
        );
      case 'fill_multiple_blanks':
        final userAnswers = userAnswer as List;
        final correctAnswers = currentQuestion.correctAnswer as List;
        final parts = currentQuestion.text.split('____');
        
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              children: [
                Text('Your answers: ', style: TextStyle(
                  color: isCorrect ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                )),
                ...List.generate(userAnswers.length, (i) => [
                  if (i > 0) const Text(', '),
                  Text(userAnswers[i].toString(),
                    style: TextStyle(
                      color: _isAnswerCorrectAtIndex(userAnswers[i].toString(), correctAnswers[i].toString()) 
                        ? Colors.green 
                        : Colors.red,
                    ),
                  ),
                ]).expand((x) => x),
              ],
            ),
            if (!isCorrect) ...[
              const SizedBox(height: 8),
              const Text('Correct answers:', style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              )),
              Text(correctAnswers.join(', '),
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ],
        );
      default:
        return const Text('Unknown question type');
    }
  }

  Color _getAnswerColor(QuestionModel currentQuestion, dynamic userAnswer, int index) {
    if (userAnswer == null || currentQuestion.type != 'multiple_choice') {
      return Colors.black;
    }

    final List<bool> answers = userAnswer as List<bool>;
    final isCorrectOption = (currentQuestion.correctAnswer as List).contains(index);
    final wasSelected = answers[index];

    if (isCorrectOption && wasSelected) return Colors.green;
    if (!isCorrectOption && wasSelected) return Colors.red;
    if (isCorrectOption && !wasSelected) return Colors.red;
    return Colors.black;
  }

  bool _isAnswerCorrectAtIndex(String userAnswer, String correctAnswer) {
    return userAnswer.trim().toLowerCase() == correctAnswer.trim().toLowerCase();
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
        return userAnswer.toString().toLowerCase() == 
               question.correctAnswer.toString().toLowerCase();
      case 'fill_multiple_blanks':
        try {
          final correctAnswers = question.correctAnswer as List;
          final userAnswers = userAnswer as List;
          if (correctAnswers.length != userAnswers.length) return false;
          
          for (var i = 0; i < correctAnswers.length; i++) {
            if (!_isAnswerCorrectAtIndex(
              userAnswers[i].toString(),
              correctAnswers[i].toString()
            )) {
              return false;
            }
          }
          return true;
        } catch (e) {
          return false;
        }
      default:
        return false;
    }
  }
}