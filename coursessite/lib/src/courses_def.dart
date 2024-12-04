// final List<Map<String, Object>> site = {
final Map<String, Object> site = {
  'courses': [
    {
      'id': '1',
      'name': 'Flutter',
      'description':
          'Flutter is Google’s UI toolkit for building beautiful, natively compiled applications for mobile, web, and desktop from a single codebase.',
      'image': 'assets/images/flutter.png',
      'url': 'https://flutter.dev/',
    },
    {
      'id': '2',
      'name': 'Dart',
      'description':
          'Dart is a client-optimized programming language for apps on multiple platforms. It is developed by Google and is used to build mobile, desktop, server, and web applications.',
      'image': 'assets/images/dart.png',
      'url': 'https://dart.dev/',
    },
    {
      'id': '3',
      'name': 'Python',
      'description':
          'Python is an interpreted, high-level and general-purpose programming language. Python\'s design philosophy emphasizes code readability with its notable use of significant whitespace.',
      'image': 'assets/images/python.png',
      'url': 'https://www.python.org/',
      'courses': [
        {
          'id': '1',
          'name': 'Python Basics',
          'sluggedName': 'python-basics',
          'description': 'Python Basics',
          'image': 'assets/images/python.png',
          'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
          'steps': [
            {
              'id': '1',
              'name': 'What is Python',
              'description': 'Explain what is Python and main features',
              'image': 'assets/images/python.png',
              'type': 'video',
              'src': 'assets/videos/python.mp4', //S3 link
            },
            {
              'id': '2',
              'name': 'Python Installation in Windows',
              'description': 'Python Installation in Windows OS',
              'image': 'assets/images/python.png',
              'type': 'video',
              'src': 'assets/videos/python_installation.mp4',
            },
            {
              'id': '3',
              'name': 'Python Types',
              'description':
                  'Explain int, float, string, boolean, list, tuple, set, dictionary data types',
              'image': 'assets/images/python.png',
              'type': 'video',
              'src': 'assets/videos/python_installation.mp4',
            },
            {
              'id': '4',
              'name': 'Python Types Quizz',
              'description':
                  'Explain int, float, string, boolean, list, tuple, set, dictionary data types',
              'image': 'assets/images/python.png',
              'type': 'quiz',
              'src': 'assets/videos/python_types_quiz.json',
            },
          ]
        },
        {
          'id': '2',
          'name': 'Python Intermediate',
          'sluggedName': 'python-intermediate',
          'description': 'Python Intermediate',
          'image': 'assets/images/python.png',
          'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
        },
        {
          'id': '3',
          'name': 'Python Advanced',
          'sluggedName': 'python-advanced',
          'stepsName': 'pythonBasicsCourseSteps',
          'description': 'Python Advanced',
          'image': 'assets/images/python.png',
          'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
        },
      ]
    },
    {
      'id': '4',
      'name': 'Java',
      'description':
          'Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible.',
      'image': 'assets/images/java.png',
      'url': 'https://www.java.com/en/',
    },
    {
      'id': '5',
      'name': 'C#',
      'description':
          'C# is a general-purpose, multi-paradigm programming language encompassing strong typing, lexically scoped, imperative, declarative, functional, generic, object-oriented (class-based), and component-oriented programming disciplines.',
      'image': 'assets/images/csharp.png',
      'url': 'https://docs.microsoft.com/en-us/dotnet/csharp/',
    },
    {
      'id': '6',
      'name': 'C++',
      'description':
          'C++ is a general-purpose programming language created by Bjarne Stroustrup as an extension of the C programming language, or "C with Classes".',
      'image': 'assets/images/cpp.png',
      'url': 'https://www.cplusplus.com/',
    },
    {
      'id': '7',
      'name': 'C',
      'description':
          'C is a general-purpose, procedural computer programming language supporting structured programming, lexical variable scope, and recursion, with a static type system.',
      'image': 'assets/images/c.png',
      'url': 'https://en.wikipedia.org/wiki/C_(programming_language)',
    },
  ],
  'resources': [
    {
      'id': '1',
      'name': 'Courses',
      'description': 'All courses offered by our team',
      'image': 'assets/images/courses.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '2',
      'name': 'Tutorials',
      'description': 'All tutorials offered by our team',
      'image': 'assets/images/tutorials.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '3',
      'name': 'Blogs',
      'description': 'All blogs offered by our team',
      'image': 'assets/images/blogs.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '4',
      'name': 'Podcasts',
      'description': 'All podcasts offered by our team',
      'image': 'assets/images/podcasts.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '5',
      'name': 'Books',
      'description': 'All books offered by our team',
      'image': 'assets/images/books.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '6',
      'name': 'Videos',
      'description': 'All videos offered by our team',
      'image': 'assets/images/videos.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '7',
      'name': 'News',
      'description': 'All news offered by our team',
      'image': 'assets/images/news.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
    },
    {
      'id': '8',
      'name': 'Events',
      'description': 'All events offered by our team',
      'image': 'assets/images/events.png',
      'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw'
    }
  ]
};
final List<Map<String, Object>> pythonCourses = [
  {
    'id': '1',
    'name': 'Python Basics',
    'sluggedName': 'python-basics',
    'description': 'Python Basics',
    'image': 'assets/images/python.png',
    'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
  },
  {
    'id': '2',
    'name': 'Python Intermediate',
    'sluggedName': 'python-intermediate',
    'description': 'Python Intermediate',
    'image': 'assets/images/python.png',
    'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
  },
  {
    'id': '3',
    'name': 'Python Advanced',
    'sluggedName': 'python-advanced',
    'stepsName': 'pythonBasicsCourseSteps',
    'description': 'Python Advanced',
    'image': 'assets/images/python.png',
    'url': 'https://www.youtube.com/watch?v=rfscVS0vtbw',
  },
];

final List<Map<String, Object>> pythonBasicsCourseSteps = [
  {
    'id': '1',
    'name': 'What is Python',
    'description': 'Explain what is Python and main features',
    'image': 'assets/images/python.png',
    'type': 'video',
    'src': 'assets/videos/python.mp4', //S3 link
  },
  {
    'id': '2',
    'name': 'Python Installation in Windows',
    'description': 'Python Installation in Windows OS',
    'image': 'assets/images/python.png',
    'type': 'video',
    'src': 'assets/videos/python_installation.mp4',
  },
  {
    'id': '3',
    'name': 'Python Types',
    'description':
        'Explain int, float, string, boolean, list, tuple, set, dictionary data types',
    'image': 'assets/images/python.png',
    'type': 'video',
    'src': 'assets/videos/python_installation.mp4',
  },
  {
    'id': '4',
    'name': 'Python Types Quizz',
    'description':
        'Explain int, float, string, boolean, list, tuple, set, dictionary data types',
    'image': 'assets/images/python.png',
    'type': 'quiz',
    'src': 'assets/videos/python_types_quiz.json',
  },
];
final List<Map<String, Object>> _resources = [
  {
    'id': '1',
    'name': 'Courses',
    'description': 'All courses offered by our team',
    'image': 'assets/images/courses.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '2',
    'name': 'Tutorials',
    'description': 'All tutorials offered by our team',
    'image': 'assets/images/tutorials.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '3',
    'name': 'Blogs',
    'description': 'All blogs offered by our team',
    'image': 'assets/images/blogs.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '4',
    'name': 'Podcasts',
    'description': 'All podcasts offered by our team',
    'image': 'assets/images/podcasts.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '5',
    'name': 'Books',
    'description': 'All books offered by our team',
    'image': 'assets/images/books.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '6',
    'name': 'Videos',
    'description': 'All videos offered by our team',
    'image': 'assets/images/videos.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '7',
    'name': 'News',
    'description': 'All news offered by our team',
    'image': 'assets/images/news.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw',
  },
  {
    'id': '8',
    'name': 'Events',
    'description': 'All events offered by our team',
    'image': 'assets/images/events.png',
    'url': 'https://www.youtube.com/channel/UCwXdFgeE9KYzlDdR7TG9cMw'
  }
];
