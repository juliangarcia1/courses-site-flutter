import 'package:flutter/material.dart';
import 'package:coursessite/core/data/courses_data.dart';

class Course extends StatefulWidget {
  const Course({super.key, required this.courseName, required this.steps});

  final String courseName;
  final String steps;

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  int _index = 0;
  bool _isMenuVisible = false;  // Changed from true to false
  late final Map<String, dynamic> currentCourse;

  @override
  void initState() {
    super.initState();
    currentCourse = courses.firstWhere(
      (course) => course['title'] == widget.courseName,
      orElse: () => courses[0],
    );
  }

  Widget _buildContent(Map<String, dynamic> content) {
    switch(content['type']) {
      case 'article':
        return LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Container(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Article',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      content['content'] as String,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      
      case 'video':
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.play_circle_fill, size: 84),
                    const SizedBox(height: 16),
                    Text(
                      content['title'] as String,
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Duration: ${content['duration']}',
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Implement video playback
                      },
                      child: const Text('Watch Video'),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      
      case 'quiz':
      case 'final_quiz':
        return LayoutBuilder(
          builder: (context, constraints) {
            return Container(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content['type'] == 'final_quiz' ? 'Final Assessment' : 'Quiz',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: (content['questions'] as List).length,
                      itemBuilder: (context, index) {
                        final question = content['questions'][index];
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'Q${index + 1}: ${question['question']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ...List.generate(
                                question['options'].length,
                                (i) => RadioListTile<int>(
                                  value: i,
                                  groupValue: null,
                                  onChanged: (value) {
                                    // TODO: Handle answer selection
                                  },
                                  title: Text(question['options'][i]),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      
      default:
        return const Center(
          child: Text('Unknown content type'),
        );
    }
  }

  Widget _buildContentList() {
    return Stack(
      children: [
        // Main content area
        Container(
          padding: const EdgeInsets.all(16),
          child: _buildContent(currentCourse['content'][_index]),
        ),
        // Menu overlay
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          right: _isMenuVisible ? 0 : -300,
          top: 0,
          bottom: 0,
          width: 300,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(-2, 0),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      currentCourse['content'].length,
                      (index) {
                        final content = currentCourse['content'][index];
                        return Card(
                          elevation: 0,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4
                          ),
                          color: _index == index 
                              ? Theme.of(context).brightness == Brightness.dark
                                  ? Colors.grey[800] // Dark mode selection color
                                  : Theme.of(context).primaryColor.withOpacity(0.1)
                              : null,
                          child: ListTile(
                            selectedTileColor: Colors.transparent, // Remove default selection color
                            leading: Icon(
                              _getIconForContentType(content['type']),
                              color: _index == index 
                                  ? Theme.of(context).primaryColor 
                                  : Colors.grey,
                            ),
                            title: Text(
                              content['title'],
                              style: TextStyle(
                                fontSize: 14,
                                // Removed color override for selected items
                              ),
                            ),
                            dense: true,
                            selected: _index == index,
                            onTap: () {
                              setState(() {
                                _index = index;
                                _isMenuVisible = false;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  IconData _getIconForContentType(String type) {
    switch (type) {
      case 'article':
        return Icons.description_outlined;  // Changed to more consistent outlined icon
      case 'video':
        return Icons.ondemand_video_outlined;  // Changed to more consistent outlined icon
      case 'quiz':
        return Icons.quiz_outlined;
      case 'final_quiz':
        return Icons.workspace_premium_outlined;  // Changed to more consistent outlined icon
      default:
        return Icons.circle_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Course ${widget.courseName}"),
        actions: [
          IconButton(
            icon: Icon(_isMenuVisible ? Icons.menu_open : Icons.menu),
            onPressed: () => setState(() => _isMenuVisible = !_isMenuVisible),
          ),
        ],
      ),
      body: _buildContentList(),
    );
  }
}
