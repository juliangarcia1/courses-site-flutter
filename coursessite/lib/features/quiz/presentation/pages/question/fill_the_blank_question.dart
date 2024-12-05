import 'package:flutter/material.dart';
import '../../../domain/models/quiz_model.dart';

class FillTheBlankQuestion extends StatefulWidget {
  final QuestionModel question;
  final Function(String)? onAnswered;

  const FillTheBlankQuestion({
    Key? key, 
    required this.question,
    this.onAnswered,
  }) : super(key: key);

  FillTheBlankQuestion copyWith({Function(String)? onAnswered}) {
    return FillTheBlankQuestion(
      question: question,
      onAnswered: onAnswered ?? this.onAnswered,
    );
  }

  @override
  State<FillTheBlankQuestion> createState() => _FillTheBlankQuestionState();
}

class _FillTheBlankQuestionState extends State<FillTheBlankQuestion> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    widget.onAnswered?.call(_controller.text);
  }

  @override
  void dispose() {
    _controller.removeListener(_onTextChanged);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final parts = widget.question.text.split('____');
    
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Complete the sentence:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text(parts[0], style: const TextStyle(fontSize: 16)),
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
              ),
              Text(parts[1], style: const TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
