import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

// Root App
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi Screen App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Main Screen with Bottom Navigation
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeCounterScreen(),
    TwitterScreen(),
    CourtCounterScreen(),
    FacebookSplashScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Twitter'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_basketball),
            label: 'Court',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.facebook),
            label: 'Facebook',
          ),
        ],
      ),
    );
  }
}

class HomeCounterScreen extends StatefulWidget {
  @override
  _HomeCounterScreenState createState() => _HomeCounterScreenState();
}

class _HomeCounterScreenState extends State<HomeCounterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Flutter Home'),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text('$_counter', style: TextStyle(fontSize: 28)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

class TwitterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FaIcon(FontAwesomeIcons.twitter, size: 80, color: Colors.white),
      ),
    );
  }
}

class CourtCounterScreen extends StatefulWidget {
  @override
  _CourtCounterScreenState createState() => _CourtCounterScreenState();
}

class _CourtCounterScreenState extends State<CourtCounterScreen> {
  int teamAScore = 0;
  int teamBScore = 0;

  void addPoints(bool isTeamA, int points) {
    setState(() {
      if (isTeamA)
        teamAScore += points;
      else
        teamBScore += points;
    });
  }

  void resetScore() {
    setState(() {
      teamAScore = 0;
      teamBScore = 0;
    });
  }

  Widget teamColumn(String name, bool isTeamA) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(name, style: TextStyle(fontSize: 20)),
        Text(
          isTeamA ? '$teamAScore' : '$teamBScore',
          style: TextStyle(fontSize: 60),
        ),
        ElevatedButton(
          onPressed: () => addPoints(isTeamA, 3),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text('+3 POINTS'),
        ),
        ElevatedButton(
          onPressed: () => addPoints(isTeamA, 2),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text('+2 POINTS'),
        ),
        ElevatedButton(
          onPressed: () => addPoints(isTeamA, 1),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text('FREE THROW'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Court Counter'),
        backgroundColor: Colors.orange,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          teamColumn('Team A', true),
          VerticalDivider(thickness: 2),
          teamColumn('Team B', false),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: resetScore,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
          child: Text('RESET'),
        ),
      ),
    );
  }
}

class FacebookSplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(), // top space
            Center(
              child: Image.asset(
                'images/facebooklogo.png',
                width: 80,
                height: 80,
              ),
            ),
            Column(
              children: [
                Text(
                  'FACEBOOK',
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(FontAwesomeIcons.facebook, color: Colors.grey),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.instagram, color: Colors.grey),
                    SizedBox(width: 10),
                    FaIcon(
                      FontAwesomeIcons.facebookMessenger,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.whatsapp, color: Colors.grey),
                    SizedBox(width: 10),
                    FaIcon(FontAwesomeIcons.youtube, color: Colors.grey),
                  ],
                ),
                SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
