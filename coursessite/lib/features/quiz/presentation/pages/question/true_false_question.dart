import 'package:flutter/material.dart';
import '../../../domain/models/quiz_model.dart';

class TrueFalseQuestion extends StatefulWidget {
  final QuestionModel question;
  final Function(bool)? onAnswered;

  const TrueFalseQuestion({
    Key? key, 
    required this.question,
    this.onAnswered,
  }) : super(key: key);

  TrueFalseQuestion copyWith({Function(bool)? onAnswered}) {
    return TrueFalseQuestion(
      question: question,
      onAnswered: onAnswered ?? this.onAnswered,
    );
  }

  @override
  State<TrueFalseQuestion> createState() => _TrueFalseQuestionState();
}

class _TrueFalseQuestionState extends State<TrueFalseQuestion> {
  bool? selectedAnswer;

  void _updateAnswer(bool? value) {
    setState(() {
      selectedAnswer = value;
      if (value != null) {
        widget.onAnswered?.call(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              widget.question.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: Column(
              children: [
                RadioListTile<bool>(
                  title: const Text('True'),
                  value: true,
                  groupValue: selectedAnswer,
                  onChanged: _updateAnswer,
                ),
                RadioListTile<bool>(
                  title: const Text('False'),
                  value: false,
                  groupValue: selectedAnswer,
                  onChanged: _updateAnswer,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}