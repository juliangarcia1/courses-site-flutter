import 'package:flutter/material.dart';
import '../../../domain/models/quiz_model.dart';

class YesNoQuestion extends StatefulWidget {
  final QuestionModel question;
  final Function(String)? onAnswered;

  const YesNoQuestion({
    Key? key, 
    required this.question,
    this.onAnswered,
  }) : super(key: key);

  YesNoQuestion copyWith({Function(String)? onAnswered}) {
    return YesNoQuestion(
      question: question,
      onAnswered: onAnswered ?? this.onAnswered,
    );
  }

  @override
  State<YesNoQuestion> createState() => _YesNoQuestionState();
}

class _YesNoQuestionState extends State<YesNoQuestion> {
  String? selectedAnswer;

  void _updateAnswer(String? value) {
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
          Text(
            widget.question.text,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          RadioListTile<String>(
            title: const Text('Yes'),
            value: 'yes',
            groupValue: selectedAnswer,
            onChanged: _updateAnswer,
          ),
          RadioListTile<String>(
            title: const Text('No'),
            value: 'no',
            groupValue: selectedAnswer,
            onChanged: _updateAnswer,
          ),
        ],
      ),
    );
  }
}
