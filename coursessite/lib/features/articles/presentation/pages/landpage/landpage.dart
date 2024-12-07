import 'package:flutter/material.dart';
import 'package:coursessite/core/data/courses_data.dart';
import 'package:coursessite/features/articles/presentation/widgets/course_card.dart';
import '../common/carrousel.dart';

class Landpage extends StatelessWidget {
  const Landpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 200, // Fixed height for carousel
            child: Carrousel(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 280, // Account for AppBar and Carousel
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
              ),
              itemCount: courses.length,
              itemBuilder: (context, index) {
                final course = courses[index];
                return CourseCard(
                  title: course['title'] as String,
                  description: course['description'] as String,
                  category: course['category'] as String,
                  image: course['image'] as String,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/course',
                      arguments: {
                        'courseName': course['title'],
                        'content': course['content'],
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}