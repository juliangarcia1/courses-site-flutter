
import 'package:flutter/material.dart';

class Carrousel extends StatelessWidget {
  const Carrousel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child :Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "images/tree2.jpeg",
            width: MediaQuery.of(context).size.width,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Accept'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Cancel'),
              ),
            ],
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('Python Basico'),
                  subtitle: Text('Julian Garcia. | 8hrs'),
                ),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/landpage');
                      },
                      child: const Text('Preview'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/python-basics');
                      },
                      child: const Text('Empezar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  leading: Icon(Icons.album),
                  title: Text('Python Intermedio'),
                  subtitle: Text('Julian Garcia. | 8.5hrs'),
                ),
                ButtonBar(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Preview'),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Empezar'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
        ]));
    // const Positioned(
    //   top: 10,
    //   left: 10,
    //   right: 50,
    //   child:  Placeholder(),
    // ),
  }
}
