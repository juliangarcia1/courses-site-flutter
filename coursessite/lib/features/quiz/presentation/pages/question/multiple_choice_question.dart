import 'package:flutter/material.dart';
import '../../../domain/models/quiz_model.dart';

class MultipleChoiceQuestion extends StatefulWidget {
  final QuestionModel question;
  final Function(List<bool>)? onAnswered;

  const MultipleChoiceQuestion({
    Key? key,
    required this.question,
    this.onAnswered,
  }) : super(key: key);

  MultipleChoiceQuestion copyWith({Function(List<bool>)? onAnswered}) {
    return MultipleChoiceQuestion(
      question: question,
      onAnswered: onAnswered ?? this.onAnswered,
    );
  }

  @override
  State<MultipleChoiceQuestion> createState() => _MultipleChoiceQuestionState();
}

class _MultipleChoiceQuestionState extends State<MultipleChoiceQuestion> {
  late List<bool> selectedAnswers;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.generate(widget.question.options.length, (_) => false);
  }

  void _updateAnswer(int index, bool? value) {
    setState(() {
      selectedAnswers[index] = value ?? false;
      widget.onAnswered?.call(List<bool>.from(selectedAnswers));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              widget.question.text,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          for (var i = 0; i < widget.question.options.length; i++)
            CheckboxListTile(
              value: selectedAnswers[i],
              onChanged: (bool? value) {
                _updateAnswer(i, value);
              },
              title: Text(widget.question.options[i]),
              contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
            ),
        ],
      ),
    );
  }
}