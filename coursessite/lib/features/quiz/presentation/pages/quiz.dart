import 'package:flutter/material.dart';
import '../../domain/models/quiz_model.dart';
import '../../data/sample_quiz.dart';
import 'question/multiple_choice_question.dart';
import 'question/true_false_question.dart';
import 'question/fill_multiple_blanks_question.dart';
import 'question/fill_the_blank_question.dart';
import 'question/yes_no_question.dart';
import '../widgets/quiz_summary.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuizModel? quiz;
  int _currentQuestionIndex = 0;
  Map<int, dynamic> userAnswers = {};
  bool _showingSummary = false;

  @override
  void initState() {
    super.initState();
    _loadQuiz();
  }

  void _loadQuiz() {
    setState(() {
      quiz = QuizModel.fromJson(sampleQuiz);
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < quiz!.questions.length - 1) {
        _currentQuestionIndex++;
      }
    });
  }

  void _prevQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _submitQuiz() {
    setState(() {
      _showingSummary = true;
    });
  }

  void _onAnswerSelected(int questionIndex, dynamic answer) {
    setState(() {
      userAnswers[questionIndex] = answer;
    });
  }

  Widget _buildQuestion(QuestionModel question) {
    switch (question.type) {
      case 'multiple_choice':
        return MultipleChoiceQuestion(question: question);
      case 'true_false':
        return TrueFalseQuestion(question: question);
      case 'fill_the_blank':
        return FillTheBlankQuestion(question: question);
      case 'fill_multiple_blanks':
        return FillMultipleBlanksQuestion(question: question);
      case 'yes_no':
        return YesNoQuestion(question: question);
      default:
        return const Text('Unknown question type');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (quiz == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (_showingSummary) {
      return Scaffold(
        appBar: AppBar(title: const Text('Quiz Summary')),
        body: QuizSummary(quiz: quiz!, userAnswers: userAnswers),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(quiz!.title),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: IndexedStack(
                index: _currentQuestionIndex,
                children: quiz!.questions.asMap().entries.map((entry) {
                  return _buildQuestion(entry.value)
                      .wrapWithCallback((answer) => _onAnswerSelected(entry.key, answer));
                }).toList(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _currentQuestionIndex > 0
                    ? ElevatedButton(
                        onPressed: _prevQuestion,
                        child: const Text('Prev'),
                      )
                    : const SizedBox(width: 0),
                  _currentQuestionIndex < quiz!.questions.length - 1
                    ? ElevatedButton(
                        onPressed: _nextQuestion,
                        child: const Text('Next'),
                      )
                    : ElevatedButton(
                        onPressed: _submitQuiz,
                        child: const Text('Submit'),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

extension QuestionCallback on Widget {
  Widget wrapWithCallback(Function(dynamic) callback) {
    if (this is MultipleChoiceQuestion) {
      return (this as MultipleChoiceQuestion).copyWith(onAnswered: callback);
    }
    if (this is TrueFalseQuestion) {
      return (this as TrueFalseQuestion).copyWith(onAnswered: callback);
    }
    if (this is YesNoQuestion) {
      return (this as YesNoQuestion).copyWith(onAnswered: callback);
    }
    if (this is FillTheBlankQuestion) {
      return (this as FillTheBlankQuestion).copyWith(onAnswered: callback);
    }
    if (this is FillMultipleBlanksQuestion) {
      return (this as FillMultipleBlanksQuestion).copyWith(onAnswered: callback);
    }
    return this;
  }
}