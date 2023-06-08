import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  final List _pages = [Metric(), Standard()];

  final TextEditingController inchesText = TextEditingController();
  final TextEditingController poundsText = TextEditingController();

  _changeTab(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff9CC4B2),
        body: _pages[_selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffD5BBB1),
          currentIndex: _selectedTab,
          onTap: (index) => _changeTab(index),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.horizontal_rule_rounded), label: "Metric"),
            BottomNavigationBarItem(
                icon: Icon(Icons.monitor_weight_outlined), label: "Standard")
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
  double calculateMetricBmi(double kilograms, double metres) {
    double bmi = kilograms / metres * metres;
    return bmi;
  }

  final TextEditingController metreText = TextEditingController();

  final TextEditingController kilogramsText = TextEditingController();

  @override
  void dispose() {
    metreText.dispose();
    kilogramsText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Type in your height',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 80,
                  child: TextField(
                    controller: metreText,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    color: const Color(0xffD5BBB1), child: const Text('Meters'))
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Type in your weight',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 80,
                  child: TextField(
                    controller: kilogramsText,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    color: const Color(0xffD5BBB1),
                    child: const Text('Kilograms')),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 70,
            width: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff393D3F),
                ),
                onPressed: () {
                  String text = metreText.text;
                  String textK = kilogramsText.text;
                  double metre = double.parse(text);
                  double kilogram = double.parse(textK);
                  double result = calculateMetricBmi(kilogram, metre);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MetricResult(
                        result: result,
                      ),
                    ),
                  );
                },
                child: const Text('Calculate BMI')),
          )
        ],
      ),
    );
  }
}

class Standard extends StatefulWidget {
  const Standard({Key? key}) : super(key: key);

  @override
  State<Standard> createState() => _StandardState();
}

class _StandardState extends State<Standard> {
  final TextEditingController inchesText = TextEditingController();

  final TextEditingController poundsText = TextEditingController();

  double calculateStandardBmi(double pounds, double inches) {
    double bmi = pounds * 703 / inches * inches;
    return bmi;
  }

  @override
  void dispose() {
    inchesText.dispose();
    poundsText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Type in your height',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 80,
                  child: TextField(
                    controller: inchesText,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    color: const Color(0xff358600), child: const Text('Inches'))
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Type in your weight',
            style: TextStyle(fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Row(
              children: [
                SizedBox(
                  height: 30,
                  width: 80,
                  child: TextField(
                    controller: poundsText,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        fillColor: Colors.white,
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.greenAccent))),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    color: const Color(0xff358600), child: const Text('Pounds')),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 70,
            width: 100,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff393D3F),
                ),
                onPressed: () {
                  String text = inchesText.text;
                  String textK = poundsText.text;
                  double inches = double.parse(text);
                  double pounds = double.parse(textK);
                  double result = calculateStandardBmi(pounds, inches);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StandardResult(
                        result: result,
                      ),
                    ),
                  );
                },
                child: const Text('Calculate BMI')),
          )
        ],
      ),
    );
  }
}







class MetricResult extends StatelessWidget {
  const MetricResult({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9CC4B2),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
              child: Text(
            'Your BMI is ',
            style: TextStyle(fontSize: 40),
          )),
          const SizedBox(
            height: 80,
          ),
          Center(
              child: Text(
            '$result',
            style: const TextStyle(fontSize: 50),
          )),
        ],
      ),
    );
  }
}


class StandardResult extends StatelessWidget {
  const StandardResult({super.key, required this.result});

  final double result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff9CC4B2),
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          const Center(
              child: Text(
                'Your BMI is ',
                style: TextStyle(fontSize: 40),
              )),
          const SizedBox(
            height: 80,
          ),
          Center(
              child: Text(
                '$result',
                style: const TextStyle(fontSize: 50),
              )),
        ],
      ),
    );
  }
}
