import 'package:flutter/material.dart';

void main() {
  runApp(AgriGuideApp());
}

class AgriGuideApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AgriGuide',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AgriGuide'),
      ),
      body: HomeContent(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add action here
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8.0),
      children: <Widget>[
        Center(
          child: Text(
            'Welcome to AgriGuide',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Image.network('https://example.com/image.jpg'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Chip(label: Text('Crop Info')),
            Chip(label: Text('Weather')),
            Chip(label: Text('Market Prices')),
          ],
        ),
        SizedBox(height: 10),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return Center(
              child: SelectableCard(index: index),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.blue,
            height: 50,
            width: 50,
          ),
        ),
        Transform.rotate(
          angle: 0.1,
          child: Container(
            color: Colors.green,
            height: 100,
            width: 100,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(minWidth: 100, maxWidth: 200),
          child: Container(
            color: Colors.orange,
            height: 100,
          ),
        ),
        SizedBox(
          height: 20,
          child: Text('Sized Box'),
        ),
        FittedBox(
          child: Text('Fitted Box'),
        ),
        RotatedBox(
          quarterTurns: 1,
          child: Text('Rotated Box'),
        ),
      ],
    );
  }
}

class SelectableCard extends StatelessWidget {
  final int index;
  SelectableCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.info, size: 50),
          SizedBox(height: 10),
          Text('Item $index', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
