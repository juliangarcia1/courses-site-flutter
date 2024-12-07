import 'package:flutter/material.dart';

class CourseCard extends StatelessWidget {
  final String title;
  final String description;
  final String category;
  final String image;
  final VoidCallback onTap;

  const CourseCard({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              height: 100, // Reduced height
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => 
                Container(
                  height: 100, // Match reduced height
                  color: Colors.grey[300],
                  child: const Icon(Icons.error),
                ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14, // Reduced font size
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Expanded(
                      child: Text(
                        description,
                        style: const TextStyle(fontSize: 12), // Reduced font size
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Chip(
                      label: Text(
                        category,
                        style: const TextStyle(fontSize: 10), // Reduced font size
                      ),
                      backgroundColor: category == 'Mathematics' 
                        ? Colors.blue[100] 
                        : Colors.green[100],
                      padding: EdgeInsets.zero, // Reduced padding
                      labelPadding: const EdgeInsets.symmetric(horizontal: 8), // Reduced padding
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}