import 'package:flutter/material.dart';
import '../../../domain/models/quiz_model.dart';

class FillMultipleBlanksQuestion extends StatefulWidget {
  final QuestionModel question;
  final Function(List<String>)? onAnswered;

  const FillMultipleBlanksQuestion({
    Key? key, 
    required this.question,
    this.onAnswered,
  }) : super(key: key);

  FillMultipleBlanksQuestion copyWith({Function(List<String>)? onAnswered}) {
    return FillMultipleBlanksQuestion(
      question: question,
      onAnswered: onAnswered ?? this.onAnswered,
    );
  }

  @override
  State<FillMultipleBlanksQuestion> createState() => _FillMultipleBlanksQuestionState();
}

class _FillMultipleBlanksQuestionState extends State<FillMultipleBlanksQuestion> {
  late final List<TextEditingController> _controllers;

  void _notifyAnswers() {
    final answers = _controllers.map((c) => c.text).toList();
    widget.onAnswered?.call(answers);
  }

  @override
  void initState() {
    super.initState();
    // Initialize controllers based on number of blanks
    final blankCount = widget.question.correctAnswer.length;
    _controllers = List.generate(
      blankCount,
      (_) => TextEditingController()..addListener(_notifyAnswers),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.removeListener(_notifyAnswers);
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
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
          Text(
            'Complete the sentence:',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              for (var i = 0; i < parts.length; i++) ...[
                Text(parts[i], style: const TextStyle(fontSize: 16)),
                if (i < _controllers.length)
                  SizedBox(
                    width: 100,
                    child: TextField(
                      controller: _controllers[i],
                      decoration: const InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      ),
                    ),
                  ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
