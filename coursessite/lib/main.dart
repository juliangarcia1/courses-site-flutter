import 'package:coursessite/features/articles/presentation/pages/landpage/landpage.dart';
import 'package:coursessite/features/authentication/presentation/sign_in.dart';
import 'package:flutter/material.dart';

import 'features/articles/presentation/pages/common/custom_drawer.dart';
import 'features/articles/presentation/pages/course/course.dart';
// import 'pages/landpage.dart';
// import 'src/courses_def.dart' as config show _resources,  siteName;
import 'features/articles/presentation/pages/login/login.dart';
import 'features/authentication/presentation/reset_password.dart';
import 'features/authentication/presentation/sign_up.dart';
import 'src/courses_def.dart' as config;

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final bool _isLogged = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Courses Site',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // appBar: AppB
        //   title: const Text("Courses Site"),
        // ),
        body: const Landpage(),//_isLogged ? const Landpage() : SignIn(),
        // body: const Content(),
        // const Center(
        //   child: Text("Courses Site"),
        // ),
        drawer:  const CustomDrawer(),
      ),
      routes: {
        '/landpage': (context) => const Landpage(),
        '/signin': (context) => const SignIn(),
        '/signup': (context) => const SignUp(),
        '/reset-password': (context) => const ResetPassword(),
        '/course': (context) =>
            const Course(courseName: 'Python', steps: 'pythonBasicsSteps'),
        // for over config.pythonCourse
        for (var i = 0; i < config.pythonCourses.length; i++)
          '/${config.pythonCourses[i]['sluggedName']}': (context) => Course(
                courseName: config.pythonCourses[i]['slugedName'].toString(),
                steps: config.pythonCourses[i]['stepsName'].toString(),
              ),
      },
    );
  }
}







// -----------------------------


// import 'dart:ffi';

// import 'package:flutter/material.dart';

// void main(List<String> args) {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Courses Site',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const FirstPage(),
//     );
//   }
// }

// class FirstPage extends StatelessWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//         appBar: AppBar(
//           title: const Text('Courses Site'),
//         ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed:() =>  Navigator.of(context).push(
//               MaterialPageRoute(builder: (BuildContext context) => 
//                 const SecondPage()
//               )), 
//             child: const Text('Courses Site')),
//         ),
//       );
//   }
// }

// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           // title: const Text("Second Page"),
//           automaticallyImplyLeading: true,
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         // body: Center(
//         //   child: ElevatedButton(
//         //     onPressed: () {
//         //       Navigator.pop(context);
//         //     },
//         //     child: const  Text("Go Back"),
//         //   ),
//         // ),
//       ),
//     );
    
//   }
// }

// Example of a simple Flutter app that uses a BottomNavigationBar.

// import 'dart:ffi';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//   String acceptButtonName = "Accept";
//   String cancelButtonName = "Cancel";

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MyAppExt(),
//     );
//   }
// }

// class MyAppExt extends StatefulWidget {
//   const MyAppExt({Key? key}) : super(key: key);

//   @override
//   State<MyAppExt> createState() => _MyAppExtState();
// }

// class _MyAppExtState extends State<MyAppExt> {
//   String buttonName = "Click";
//   int currentIndex = 0;
//   bool _isImageClicked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//           appBar: AppBar(
//             title: const Text('Courses Site'),
//           ),
//           body: Center(
//               child: currentIndex == 0 ? Container(
//             width: double.infinity,//Make sure we are using the full width
//             height: double.infinity,//Make sure we are using the full height
//             color: Colors.grey[400],
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.red,
//                   ),
//                     onPressed: () => {
//                           setState(() {
//                             buttonName = "Clicked";
//                           }),
//                           // buttonName = "Clicked"
//                         },
//                     child: Text(buttonName)),
//                 ElevatedButton(
//                     onPressed: () => {
//                           setState(() {
//                             // buttonName = "Clicked";
//                             Navigator.of(context).push(
//                               MaterialPageRoute(builder: (BuildContext context) => 
//                                 const SecondPage()
//                               ));
//                           }),
//                           // buttonName = "Clicked"
//                         },
//                     child: const Text('Next Page')),
//               ],
//             ),
//           ): GestureDetector(
//               onTap: (){
//                 setState(() {
//                 _isImageClicked = !_isImageClicked;
//               });
//              },
//              child: _isImageClicked ? Image.asset("images/arbol.png") : Image.network("https://cdn.adventistworld.org/wp-content/uploads/2017/04/sundown-1-1200x800.jpg") ,

//           ),
//             ),
//           bottomNavigationBar: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.search),
//                 label: 'Search',
//               ),
//               // BottomNavigationBarItem(
//               //   icon: Icon(Icons.person),
//               //   label: 'Profile',
//               // ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.settings),
//                 label: 'Settings',
//               ),
//             ],
//             currentIndex: 1,
//             onTap: (int index) {
//               setState(() {
//                 currentIndex = index;
//               });
//             },
//           )
//           );
//   }
// }


// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // title: const Text("Second Page"),
//         automaticallyImplyLeading: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const  Text("Go Back"),
//           ),
//         ),
//     );
    
//   }
// }