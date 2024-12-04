import 'package:flutter/material.dart';

// import '../../src/courses_def.dart' as courses;

class Course extends StatefulWidget {
  const Course({super.key, required this.courseName, required this.steps});

  final String courseName;
  final String steps;

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int _index = 0;


  _steps() => [
          for (var i = 0; i < 9; i++)
            Step(
              // title: Text('Step ${i + 1} title'),
              title: const Text(''),
              state: _stepState(i),
              isActive: _index == i ? true : false,
              content: Text('Content for Step ${i + 1}'),
            ),
  ];

  StepState _stepState(int step) {
    if (_index == step) {
      return  StepState.editing;
    } else if (step >_index) {
      return StepState.indexed;
    } else {
      return StepState.complete;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course ${widget.courseName}"),
      ),
      body: Stepper(
        controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Row(
          children: <Widget>[
            TextButton(
              onPressed: details.onStepCancel,
              // child: Container(),
              child: const Text('Back'),
            ),
            TextButton(
              onPressed: details.onStepContinue,
              // child: Container(),
              child: const Text('Next'),
            ),
          ],
        );
      },
        type: StepperType.horizontal,
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index -= 1;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 8) {
            setState(() {
              _index += 1;
            });
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: _steps() ,
      ),
    );
  }
}
