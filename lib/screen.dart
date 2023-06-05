import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _selectedTab = 0;

  final List _pages = [Metric(), Standard()];

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
            backgroundColor: Colors.blue,
            body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.horizontal_rule_rounded), label: "Metric"),
            BottomNavigationBarItem(icon: Icon(Icons.monitor_weight_outlined), label: "Standard")
          ],
        ),
        ),
    );
  }
}



class Metric extends StatefulWidget {
  const Metric({Key? key}) : super(key: key);

  @override
  State<Metric> createState() => _MetricState();
}

class _MetricState extends State<Metric> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        const Text('Type in your height', style: TextStyle(fontSize: 20),),
        const SizedBox(height: 10,),
        Row(
          children: const [
            SizedBox( height: 30,
                width: 20,
                child: TextField()),
            SizedBox(width: 20,),
            Text('Centimetre')
          ],
        ),
        const SizedBox(height: 20,),
        const Text('Type in your weight'),
        Row(
          children: const [
            SizedBox( height: 30,
                width: 20,
                child: TextField()),
            SizedBox(width: 20,),
            Text('Kilograms'),
          ],
        ),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {}, child: const Text('Calculate BMI'))
      ],
    );
  }
}



class Standard extends StatefulWidget {
  const Standard({Key? key}) : super(key: key);

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30,),
        const Text('Type in your height'),
        const SizedBox(height: 10,),
        Row(
          children:  const [
            SizedBox(
                height: 30,
                width: 20,
                child: TextField()),
            SizedBox(width: 20,),
            Text('Inches')
          ],
        ),
        const SizedBox(height: 20,),
        const Text('Type in your weight'),
        Row(
          children: const [
            SizedBox(
                height: 30,
                width: 20,
                child: TextField()),
            SizedBox(width: 20,),
            Text('Pounds'),
          ],
        ),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: () {}, child: const Text('Calculate BMI'))
      ],
    );
  }
}


