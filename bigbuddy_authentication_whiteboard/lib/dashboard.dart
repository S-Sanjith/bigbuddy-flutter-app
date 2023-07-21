import 'package:bigbuddy_authentication_whiteboard/whiteboard.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                // Handle the tap action for the WhiteboardCard here.
                // For example, you can navigate to the whiteboard screen.
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => MyWhiteboardApp()),
                // );
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyWhiteboardApp()));
                // print('pushed');
              },
              child: const WhiteboardCard(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: OtherCard(),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: OtherCard(),
          ),
        ],
      ),
    );
  }
}

class WhiteboardCard extends StatelessWidget {
  const WhiteboardCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 16, // the size of the shadow
        shadowColor: Colors.black,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Whiteboard')),
        ),
      ),
    );
  }
}

class OtherCard extends StatelessWidget {
  const OtherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Card(
        elevation: 16, // the size of the shadow
        shadowColor: Colors.black,
        child: SizedBox(
          width: 300,
          height: 100,
          child: Center(child: Text('Other Functionality')),
        ),
      ),
    );
  }
}

class WhiteboardScreen extends StatelessWidget {
  const WhiteboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whiteboard Screen'),
      ),
      body: const Center(
        child: Text('This is the Whiteboard Screen'),
      ),
    );
  }
}
