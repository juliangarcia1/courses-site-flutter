const courses = [
  {
    "id": "1",
    "title": "Python Programming Fundamentals",
    "description": "Learn the basics of Python programming language",
    "category": "Programming",
    "image": "https://example.com/python.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Python",
        "content": "Python is a high-level, interpreted programming language...",
      },
      {
        "type": "video",
        "title": "Setting Up Python Environment",
        "url": "https://example.com/videos/python-setup",
        "duration": "10:25",
      },
      {
        "type": "quiz",
        "title": "Python Basics Quiz",
        "questions": [
          {
            "question": "What is Python?",
            "options": [
              "A snake",
              "A programming language",
              "A web browser",
              "An operating system"
            ],
            "correctAnswer": 1
          }
        ]
      },
      {
        "type": "article",
        "title": "Variables and Data Types",
        "content": "Variables are containers for storing data values...",
      },
      {
        "type": "video",
        "title": "Working with Python Variables",
        "url": "https://example.com/videos/python-variables",
        "duration": "15:30",
      },
      {
        "type": "quiz",
        "title": "Variables Quiz",
        "questions": [
          {
            "question": "Which of these is a valid variable name?",
            "options": [
              "1variable",
              "_variable",
              "variable!",
              "class"
            ],
            "correctAnswer": 1
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Final Assessment",
        "questions": [
          {
            "question": "What is the output of print(type(5))?",
            "options": [
              "integer",
              "<class 'int'>",
              "number",
              "5"
            ],
            "correctAnswer": 1
          },
          // Add more questions...
        ]
      }
    ]
  },
  {
    "id": "2",
    "title": "Linear Algebra for Machine Learning",
    "description": "Essential mathematics for AI and ML",
    "category": "Mathematics",
    "image": "https://example.com/linear-algebra.jpg",
    "content": [
      {
        "type": "article",
        "title": "Vectors and Matrices",
        "content": "Understanding vectors and matrices is fundamental to linear algebra...",
      },
      {
        "type": "video",
        "title": "Matrix Operations",
        "url": "https://example.com/videos/matrix-ops",
        "duration": "12:30",
      },
      {
        "type": "quiz",
        "title": "Matrix Operations Quiz",
        "questions": [
          {
            "question": "What is the result of multiplying a 2x3 matrix by a 3x2 matrix?",
            "options": [
              "2x2 matrix",
              "3x3 matrix",
              "2x3 matrix",
              "3x2 matrix"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Linear Algebra Final Assessment",
        "questions": [
          {
            "question": "Which operation is not defined for matrices?",
            "options": [
              "Addition",
              "Division",
              "Multiplication",
              "Transposition"
            ],
            "correctAnswer": 1
          }
        ]
      }
    ]
  },
  {
    "id": "3",
    "title": "JavaScript Advanced Concepts",
    "description": "Deep dive into JS advanced topics",
    "category": "Programming",
    "image": "https://example.com/javascript.jpg",
    "content": [
      {
        "type": "article",
        "title": "Advanced JavaScript Concepts",
        "content": "Understanding closures, prototypes, and the event loop...",
      }
    ]
  },
  {
    "id": "4",
    "title": "Data Structures & Algorithms",
    "description": "Foundation of computer science",
    "category": "Programming",
    "image": "https://example.com/dsa.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Data Structures",
        "content": "Data structures are ways to store and organize data...",
      },
      {
        "type": "video",
        "title": "Algorithms Basics",
        "url": "https://example.com/videos/algorithms-basics",
        "duration": "14:45",
      },
      {
        "type": "quiz",
        "title": "Data Structures Quiz",
        "questions": [
          {
            "question": "Which of these is a linear data structure?",
            "options": [
              "Tree",
              "Graph",
              "Array",
              "Hash Table"
            ],
            "correctAnswer": 2
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Data Structures & Algorithms Final Assessment",
        "questions": [
          {
            "question": "What is the time complexity of binary search?",
            "options": [
              "O(n)",
              "O(log n)",
              "O(n^2)",
              "O(1)"
            ],
            "correctAnswer": 1
          }
        ]
      }
    ]
  },
  {
    "id": "5",
    "title": "Discrete Mathematics",
    "description": "Mathematical foundations for CS",
    "category": "Mathematics",
    "image": "https://example.com/discrete-math.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Discrete Mathematics",
        "content": "Discrete mathematics is the study of mathematical structures...",
      },
      {
        "type": "video",
        "title": "Set Theory Basics",
        "url": "https://example.com/videos/set-theory-basics",
        "duration": "11:20",
      },
      {
        "type": "quiz",
        "title": "Set Theory Quiz",
        "questions": [
          {
            "question": "What is a subset?",
            "options": [
              "A set containing all elements",
              "A set containing some elements",
              "A set containing no elements",
              "A set containing one element"
            ],
            "correctAnswer": 1
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Discrete Mathematics Final Assessment",
        "questions": [
          {
            "question": "What is the principle of mathematical induction?",
            "options": [
              "A method of direct proof",
              "A method of indirect proof",
              "A method of proof by contradiction",
              "A method of proof by induction"
            ],
            "correctAnswer": 3
          }
        ]
      }
    ]
  },
  {
    "id": "6",
    "title": "React Framework",
    "description": "Modern web development with React",
    "category": "Programming",
    "image": "https://example.com/react.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to React",
        "content": "React is a JavaScript library for building user interfaces...",
      },
      {
        "type": "video",
        "title": "React Components",
        "url": "https://example.com/videos/react-components",
        "duration": "13:10",
      },
      {
        "type": "quiz",
        "title": "React Basics Quiz",
        "questions": [
          {
            "question": "What is a React component?",
            "options": [
              "A function or class that returns a React element",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "React Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of React's useState hook?",
            "options": [
              "To manage state in functional components",
              "To manage side effects",
              "To handle events",
              "To create context"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "7",
    "title": "Statistics for Data Science",
    "description": "Statistical concepts for data analysis",
    "category": "Mathematics",
    "image": "https://example.com/statistics.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Statistics",
        "content": "Statistics is the science of collecting, analyzing, and interpreting data...",
      },
      {
        "type": "video",
        "title": "Descriptive Statistics",
        "url": "https://example.com/videos/descriptive-statistics",
        "duration": "16:00",
      },
      {
        "type": "quiz",
        "title": "Descriptive Statistics Quiz",
        "questions": [
          {
            "question": "What is the mean of the data set {1, 2, 3, 4, 5}?",
            "options": [
              "2",
              "3",
              "4",
              "5"
            ],
            "correctAnswer": 1
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Statistics Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of inferential statistics?",
            "options": [
              "To describe data",
              "To make predictions or inferences about a population",
              "To organize data",
              "To visualize data"
            ],
            "correctAnswer": 1
          }
        ]
      }
    ]
  },
  {
    "id": "8",
    "title": "Flutter Development",
    "description": "Cross-platform app development",
    "category": "Programming",
    "image": "https://example.com/flutter.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Flutter",
        "content": "Flutter is an open-source UI software development toolkit...",
      },
      {
        "type": "video",
        "title": "Flutter Widgets",
        "url": "https://example.com/videos/flutter-widgets",
        "duration": "18:45",
      },
      {
        "type": "quiz",
        "title": "Flutter Basics Quiz",
        "questions": [
          {
            "question": "What is a Flutter widget?",
            "options": [
              "A component that describes the configuration of an element",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Flutter Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Flutter's StatefulWidget?",
            "options": [
              "To create a widget that has mutable state",
              "To create a widget that has immutable state",
              "To handle events",
              "To create context"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "9",
    "title": "Calculus for Optimization",
    "description": "Mathematical optimization techniques",
    "category": "Mathematics",
    "image": "https://example.com/calculus.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Calculus",
        "content": "Calculus is the mathematical study of continuous change...",
      },
      {
        "type": "video",
        "title": "Derivatives and Integrals",
        "url": "https://example.com/videos/derivatives-integrals",
        "duration": "20:00",
      },
      {
        "type": "quiz",
        "title": "Calculus Basics Quiz",
        "questions": [
          {
            "question": "What is the derivative of x^2?",
            "options": [
              "2x",
              "x",
              "x^2",
              "2"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Calculus Final Assessment",
        "questions": [
          {
            "question": "What is the integral of 1/x?",
            "options": [
              "ln(x)",
              "x",
              "1/x",
              "x^2"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "10",
    "title": "Java Enterprise",
    "description": "Enterprise Java development",
    "category": "Programming",
    "image": "https://example.com/java.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Java Enterprise",
        "content": "Java Enterprise Edition (EE) is a set of specifications...",
      },
      {
        "type": "video",
        "title": "Java EE Components",
        "url": "https://example.com/videos/java-ee-components",
        "duration": "22:10",
      },
      {
        "type": "quiz",
        "title": "Java EE Basics Quiz",
        "questions": [
          {
            "question": "What is a servlet?",
            "options": [
              "A Java class that handles HTTP requests",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Java Enterprise Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Java EE's EJB?",
            "options": [
              "To manage state in enterprise applications",
              "To handle events",
              "To create context",
              "To manage transactions"
            ],
            "correctAnswer": 3
          }
        ]
      }
    ]
  },
  {
    "id": "11",
    "title": "Graph Theory",
    "description": "Mathematical structures for networks",
    "category": "Mathematics",
    "image": "https://example.com/graph-theory.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Graph Theory",
        "content": "Graph theory is the study of graphs, which are mathematical structures...",
      },
      {
        "type": "video",
        "title": "Graph Basics",
        "url": "https://example.com/videos/graph-basics",
        "duration": "19:30",
      },
      {
        "type": "quiz",
        "title": "Graph Theory Quiz",
        "questions": [
          {
            "question": "What is a vertex in a graph?",
            "options": [
              "A point where two or more edges meet",
              "A line connecting two points",
              "A loop in a graph",
              "A subgraph"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Graph Theory Final Assessment",
        "questions": [
          {
            "question": "What is the degree of a vertex?",
            "options": [
              "The number of edges connected to the vertex",
              "The number of vertices in the graph",
              "The number of loops in the graph",
              "The number of subgraphs"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "12",
    "title": "Go Programming",
    "description": "Modern backend development with Go",
    "category": "Programming",
    "image": "https://example.com/golang.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Go",
        "content": "Go is an open-source programming language designed for simplicity...",
      },
      {
        "type": "video",
        "title": "Go Basics",
        "url": "https://example.com/videos/go-basics",
        "duration": "17:00",
      },
      {
        "type": "quiz",
        "title": "Go Basics Quiz",
        "questions": [
          {
            "question": "What is a goroutine?",
            "options": [
              "A lightweight thread managed by the Go runtime",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Go Programming Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Go's channels?",
            "options": [
              "To manage state",
              "To handle events",
              "To create context",
              "To communicate between goroutines"
            ],
            "correctAnswer": 3
          }
        ]
      }
    ]
  },
  {
    "id": "13",
    "title": "Probability Theory",
    "description": "Foundations of statistical analysis",
    "category": "Mathematics",
    "image": "https://example.com/probability.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Probability Theory",
        "content": "Probability theory is the branch of mathematics concerned with probability...",
      },
      {
        "type": "video",
        "title": "Basic Probability Concepts",
        "url": "https://example.com/videos/basic-probability",
        "duration": "15:45",
      },
      {
        "type": "quiz",
        "title": "Probability Quiz",
        "questions": [
          {
            "question": "What is the probability of getting heads in a coin toss?",
            "options": [
              "0",
              "0.5",
              "1",
              "2"
            ],
            "correctAnswer": 1
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Probability Theory Final Assessment",
        "questions": [
          {
            "question": "What is the law of large numbers?",
            "options": [
              "A principle that describes the result of performing the same experiment many times",
              "A principle that describes the result of performing the same experiment once",
              "A principle that describes the result of performing different experiments many times",
              "A principle that describes the result of performing different experiments once"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "14",
    "title": "Rust Systems Programming",
    "description": "Low-level systems development",
    "category": "Programming",
    "image": "https://example.com/rust.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Rust",
        "content": "Rust is a systems programming language focused on safety and performance...",
      },
      {
        "type": "video",
        "title": "Rust Basics",
        "url": "https://example.com/videos/rust-basics",
        "duration": "21:00",
      },
      {
        "type": "quiz",
        "title": "Rust Basics Quiz",
        "questions": [
          {
            "question": "What is ownership in Rust?",
            "options": [
              "A set of rules that governs how memory is managed",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Rust Systems Programming Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Rust's borrow checker?",
            "options": [
              "To ensure memory safety",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "15",
    "title": "Number Theory in Cryptography",
    "description": "Mathematical foundations of security",
    "category": "Mathematics",
    "image": "https://example.com/number-theory.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Number Theory",
        "content": "Number theory is a branch of pure mathematics devoted to the study of integers...",
      },
      {
        "type": "video",
        "title": "Prime Numbers and Cryptography",
        "url": "https://example.com/videos/prime-numbers-cryptography",
        "duration": "18:00",
      },
      {
        "type": "quiz",
        "title": "Number Theory Quiz",
        "questions": [
          {
            "question": "What is a prime number?",
            "options": [
              "A number that has only two distinct positive divisors: 1 and itself",
              "A number that has only one distinct positive divisor: 1",
              "A number that has more than two distinct positive divisors",
              "A number that has no distinct positive divisors"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Number Theory Final Assessment",
        "questions": [
          {
            "question": "What is the RSA algorithm?",
            "options": [
              "A public-key cryptosystem",
              "A symmetric-key cryptosystem",
              "A hashing algorithm",
              "A digital signature algorithm"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "16",
    "title": "TypeScript Development",
    "description": "Typed JavaScript development",
    "category": "Programming",
    "image": "https://example.com/typescript.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to TypeScript",
        "content": "TypeScript is a typed superset of JavaScript that compiles to plain JavaScript...",
      },
      {
        "type": "video",
        "title": "TypeScript Basics",
        "url": "https://example.com/videos/typescript-basics",
        "duration": "14:00",
      },
      {
        "type": "quiz",
        "title": "TypeScript Basics Quiz",
        "questions": [
          {
            "question": "What is TypeScript?",
            "options": [
              "A typed superset of JavaScript",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "TypeScript Development Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of TypeScript's type annotations?",
            "options": [
              "To provide type information to the compiler",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "17",
    "title": "Mathematical Logic",
    "description": "Foundations of computer logic",
    "category": "Mathematics",
    "image": "https://example.com/logic.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Mathematical Logic",
        "content": "Mathematical logic is a subfield of mathematics exploring the applications of formal logic...",
      },
      {
        "type": "video",
        "title": "Propositional Logic",
        "url": "https://example.com/videos/propositional-logic",
        "duration": "16:30",
      },
      {
        "type": "quiz",
        "title": "Mathematical Logic Quiz",
        "questions": [
          {
            "question": "What is a proposition?",
            "options": [
              "A statement that is either true or false",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Mathematical Logic Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of a truth table?",
            "options": [
              "To determine the truth value of logical expressions",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "18",
    "title": "Kotlin Android Development",
    "description": "Modern Android app development",
    "category": "Programming",
    "image": "https://example.com/kotlin.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Kotlin",
        "content": "Kotlin is a modern programming language that makes developers happier...",
      },
      {
        "type": "video",
        "title": "Kotlin Basics",
        "url": "https://example.com/videos/kotlin-basics",
        "duration": "15:00",
      },
      {
        "type": "quiz",
        "title": "Kotlin Basics Quiz",
        "questions": [
          {
            "question": "What is Kotlin?",
            "options": [
              "A modern programming language",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Kotlin Android Development Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Kotlin's coroutines?",
            "options": [
              "To manage concurrency",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "19",
    "title": "Numerical Analysis",
    "description": "Computational mathematics methods",
    "category": "Mathematics",
    "image": "https://example.com/numerical.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Numerical Analysis",
        "content": "Numerical analysis is the study of algorithms that use numerical approximation...",
      },
      {
        "type": "video",
        "title": "Numerical Methods",
        "url": "https://example.com/videos/numerical-methods",
        "duration": "18:30",
      },
      {
        "type": "quiz",
        "title": "Numerical Analysis Quiz",
        "questions": [
          {
            "question": "What is numerical integration?",
            "options": [
              "A method to approximate the integral of a function",
              "A method to approximate the derivative of a function",
              "A method to approximate the root of a function",
              "A method to approximate the limit of a function"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Numerical Analysis Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of numerical differentiation?",
            "options": [
              "To approximate the derivative of a function",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  },
  {
    "id": "20",
    "title": "Swift iOS Development",
    "description": "iOS app development with Swift",
    "category": "Programming",
    "image": "https://example.com/swift.jpg",
    "content": [
      {
        "type": "article",
        "title": "Introduction to Swift",
        "content": "Swift is a powerful and intuitive programming language for iOS development...",
      },
      {
        "type": "video",
        "title": "Swift Basics",
        "url": "https://example.com/videos/swift-basics",
        "duration": "16:45",
      },
      {
        "type": "quiz",
        "title": "Swift Basics Quiz",
        "questions": [
          {
            "question": "What is Swift?",
            "options": [
              "A programming language for iOS development",
              "A JavaScript object",
              "A CSS style",
              "A HTML element"
            ],
            "correctAnswer": 0
          }
        ]
      },
      {
        "type": "final_quiz",
        "title": "Swift iOS Development Final Assessment",
        "questions": [
          {
            "question": "What is the purpose of Swift's optionals?",
            "options": [
              "To handle the absence of a value",
              "To handle events",
              "To create context",
              "To manage state"
            ],
            "correctAnswer": 0
          }
        ]
      }
    ]
  }
];