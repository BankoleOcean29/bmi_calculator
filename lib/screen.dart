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
        const Text('Type in your height', style: TextStyle(fontSize: 30),),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Row(
            children:  [
              const SizedBox( height: 30,
                  width: 80,
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: Colors.white,
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.greenAccent)
                      )
                    ),
                  ),
              ),
              const SizedBox(width: 20,),
              Container(
                color: Colors.amber,
                  child: const Text('Centimeters'))
            ],
          ),
        ),
        const SizedBox(height: 80,),
        const Text('Type in your weight', style: TextStyle(fontSize: 30),),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Row(
            children: [
              const SizedBox( height: 30,
                  width: 80,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent)
                        )
                    ),
                  ),
              ),
              const SizedBox(width: 20,),
              Container(
                color: Colors.amber,
                  child: const Text('Kilograms')),
            ],
          ),
        ),
        const SizedBox(height: 50,),
        SizedBox(
          height: 70,
          width: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              onPressed: () {},
              child: const Text('Calculate BMI')),
        )
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
        const Text('Type in your height', style: TextStyle(fontSize: 30),),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Row(
            children:  [
              const SizedBox( height: 30,
                  width: 80,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent)
                        )
                    ),
                  ),
              ),
              const SizedBox(width: 20,),
              Container(
                  color: Colors.amber,
                  child: const Text('Inches'))
            ],
          ),
        ),
        const SizedBox(height: 80,),
        const Text('Type in your weight', style: TextStyle(fontSize: 30),),
        const SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.only(left: 90.0),
          child: Row(
            children: [
              const SizedBox( height: 30,
                  width: 80,
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent)
                        )
                    ),
                  ),
              ),
              const SizedBox(width: 20,),
              Container(
                  color: Colors.amber,
                  child: const Text('Pounds')),
            ],
          ),
        ),
        const SizedBox(height: 100,),
        SizedBox(
          height: 70,
          width: 100,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
              ),
              onPressed: () {},
              child: const Text('Calculate BMI')),
        )
      ],
    );
  }
}


