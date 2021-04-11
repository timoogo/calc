import 'package:flutter/material.dart';

import 'dart:ui';

class AppColors {
  const AppColors._();

  static const Color white = Color(0xFFFFFFFF);
  static const Color displayContainerBackground = Color(0xFF3E606F);
  static const Color inputContainerBackground = Color(0xFF193441);
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatrice',
      theme: ThemeData(
        primaryColor: AppColors.inputContainerBackground,
        accentColor: AppColors.displayContainerBackground,
        primaryColorBrightness: Brightness.light,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
     static const List<List<String>> grid = <List<String>>[
    <String>["7", "8", "9", "-"],
    <String>["4", "5", "6", "*"],
    <String>["1", "2", "3", "/"],
    <String>["0", ".", "=", "+"],
  ];

   double? input;
  double? previousInput;
  String? symbol;
  void onItemClicked(String value) {

    print('On Click $value');

    switch (value) {
      case '0':
      case '1':
      case '2':
      case '3':
      case '4':
      case '5':
      case '6':
      case '7':
      case '8':
      case '9':
        onNewDigit(value);
        break;
      case '+':
      case '-':
      case '/':
      case '*':
        onNewSymbol(value);
        break;
      case '=':
        onEquals();
    }

    // Force l'interface à se redessiner
    setState(() {});
  }

  void onNewDigit(String digit) {
    // TODO
  }

  void onNewSymbol(String digit) {
    // TODO
  }

  void onEquals() {
    // TODO
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: AppColors.white, fontSize: 22.0),
        child: Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                color: AppColors.displayContainerBackground,
                alignment: AlignmentDirectional.centerEnd,
                padding: const EdgeInsets.all(22.0),
                child: Text(input?.toString() ?? "0"),
              ),
            ),
            Flexible(
              flex: 8,
              child: Ink(
                color: AppColors.inputContainerBackground,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InputButton extends StatelessWidget {


  final String label;
  final ValueChanged<String>? onTap;

  InputButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap?.call(label),
      child: Ink(
        height: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.white, width: 0.5),
            color: AppColors.inputContainerBackground),
        child: Center(
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
