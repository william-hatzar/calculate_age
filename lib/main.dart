import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

  final String fontFamily = "Poppins";
}

class _HomeState extends State<Home> {
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  Map<String, int> calculateAge(DateTime birthdate) {
    DateTime now = DateTime.now();
    int years = now.year - birthdate.year;
    int months = now.month - birthdate.month;
    int days = now.day - birthdate.day;

    if (days < 0) {
      // Calculate the days remaining in the current month
      final daysInLastMonth = DateTime(now.year, now.month, 0).day;
      days += daysInLastMonth;
      months--;
    }

    if (months < 0) {
      years--;
      months += 12;
    }

    return {'years': years, 'months': months, 'days': days};
  }


  void calculateAndDisplayAge() {
    int day = int.tryParse(dayController.text) ?? 1;
    int month = int.tryParse(monthController.text) ?? 1;
    int year = int.tryParse(yearController.text) ?? 2000;

    DateTime birthdate = DateTime(year, month, day);
    Map<String, int> age = calculateAge(birthdate);

    // Update UI with age
    setState(() {
      // Set the state variables for displaying age
      years = age['years'] ?? 0;
      months = age['months'] ?? 0;
      days = age['days'] ?? 0;
    });

    // For now, print the result
    print('Your age is: ${age['years']} years, ${age['months']} months, and ${age['days']} days.');
  }

  int years = 0;
  int months = 0;
  int days = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            width: 900,
            height: 500,
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0),
                bottomRight: Radius.circular(90.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 15.0),
                      Text("D A Y", style: TextStyle(fontFamily: widget.fontFamily, color: Colors.grey, fontWeight: FontWeight.w900)),
                      const SizedBox(width: 74.0),
                      Text("M O N T H", style: TextStyle(fontFamily: widget.fontFamily, color: Colors.grey, fontWeight: FontWeight.w900)),
                      const SizedBox(width: 39.0),
                      Text("Y E A R", style: TextStyle(fontFamily: widget.fontFamily, color: Colors.grey, fontWeight: FontWeight.w900)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 60,
                          child: TextField(
                            controller: dayController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: widget.fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 60.0,
                          child: TextField(
                            controller: monthController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: widget.fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 60.0,
                          child: TextField(
                            controller: yearController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: widget.fontFamily,
                              fontWeight: FontWeight.w900,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Stack(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(17.0),
                        child: Divider(
                          color: Color(0xfff0f0f0),
                          thickness: 2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            // Calculate and display age on button tap
                            calculateAndDisplayAge();
                          },
                          child: Container(
                            height: 60.0,
                            width: 60.0,
                            decoration: BoxDecoration(color: const Color(0xff864CFF), borderRadius: BorderRadius.circular(30.0)),
                            child: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset("images/icon-arrow.svg"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("$years", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Color(0xff8851FF))),
                            const SizedBox(width: 3),
                            Text("years", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("$months", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: const Color(0xff8851FF))),
                            const SizedBox(width: 3),
                            Text("months", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                          ],
                        ),
                        Row(
                          children: [
                            Text("$days", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: const Color(0xff8851FF))),
                            const SizedBox(width: 3),
                            Text("days", style: TextStyle(fontSize: 50, fontFamily: widget.fontFamily, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}