import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'buttons.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';

  void numClick(String text) {
    setState(() => _expression += text);
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '';
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();

    setState(() {
      _history = _expression;
      _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFF283637),
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color(0xFF545F61),
            ),
          ),
          headlineMedium: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[900],
        textTheme: TextTheme(
          bodyMedium: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Color(0xFF545F61),
            ),
          ),
          headlineMedium: GoogleFonts.rubik(
            textStyle: const TextStyle(
              fontSize: 48,
              color: Colors.white,
            ),
          ),
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          body: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  alignment: const Alignment(1.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      _history,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                Container(
                  alignment: const Alignment(1.0, 1.0),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      _expression,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: 'AC',
                        fillColor: 0xFF6C807F,
                        textSize: 20,
                        callback: allClear,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: 'C',
                        fillColor: 0xFF6C807F,
                        callback: clear,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '%',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '/',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        callback: numClick,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '7',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '8',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '9',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '*',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        textSize: 24,
                        callback: numClick,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '4',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '5',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '6',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '-',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        textSize: 38,
                        callback: numClick,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '1',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '2',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '3',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '+',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        textSize: 30,
                        callback: numClick,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '.',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '0',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        textColor: 0xFF000000,
                        text: '00',
                        fillColor: 0xFFFFFFFF,
                        callback: numClick,
                        textSize: 26,
                      ),
                    ),
                    Expanded(
                      child: CalcButton(
                        text: '=',
                        fillColor: 0xFFFFFFFF,
                        textColor: 0xFF65BDAC,
                        callback: evaluate,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
