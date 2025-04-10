import 'package:flutter/material.dart';
import 'package:flutter_practical/task/calculator/button_values.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String number1 = ""; // value only . 0-9
  String operand = ""; // values only -*/+
  String number2 = ""; // value only . 0-9

  void onBtnTap(String value) {
    if (value == Btn.del) {
      delete();
      return;
    }

    if (value == Btn.clr) {
      clearAll();
      return;
    }

    if (value == Btn.per) {
      convertToPercentage();
      return;
    }
    if(value==Btn.calculate){
      calculate();
      return;
    }
    appendValue(value);
  }

  //delete one digit on click of delete btn

  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operand.isNotEmpty) {
      operand = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
    setState(() {});
  }

  //clears all outpur

  void clearAll() {
    setState(() {
      number1 = "";
      operand = "";
      number2 = "";
    });
  }

  // convert o/p to percentage

  void convertToPercentage() {
    if (number1.isNotEmpty && operand.isNotEmpty && number2.isNotEmpty) {
      // calculate before conversion

      calculate();
    }

    if (operand.isNotEmpty) {
      //can not be converted
      return;
    }

    final number = double.parse(number1);

    setState(() {
      number1="${number/100}";
      operand="";
      number2="";
    });
  }

  // calculate the result

  void calculate()
  {
    if(number1.isEmpty ) return;
    if(operand.isEmpty ) return;
    if(number2.isEmpty ) return;

    double num1=double.parse(number1);
    double num2=double.parse(number2);

    var result=0.0;

    switch(operand){
      case Btn.add:
        result=num1+num2;
        break;

      case Btn.subtract:
        result=num1-num2;
        break;

      case Btn.multiply:
        result=num1*num2;
        break;

      case Btn.divide:
        result=num1/num2;
        break;


    }
    setState(() {
      number1="$result";

      if(number1.endsWith(".0")){
        number1=number1.substring(0,number1.length-2);
      }

      operand="";
      number2="";
    });
  }

  //append value to the end
  void appendValue(String value) {
    //number1 operand number2

    // if is operand not dot
    if (value != Btn.dot && int.tryParse(value) == null) {
      // operand pressed

      if (operand.isNotEmpty && number2.isNotEmpty) {
        // TODO calculate the equation before assigning new operand
        calculate();
      }
      operand = value;
    }
    // assign value to number1 variable

    else if (number1.isEmpty || operand.isEmpty) {

      if(number1.length==1 && number1=="0" && value==Btn.n0) return;
      if(number1.isEmpty && value==Btn.n0) return;


      //number1="1.2"
      if (value == Btn.dot && number1.contains(Btn.dot)) {
        return;
      }
      if (value == Btn.dot && (number1.isEmpty || number1 == Btn.n0)) {
        // number1="" | "0"
        value = "0.";
      }

      number1 += value;
    } else if (number2.isEmpty || operand.isNotEmpty) {

      if(number2.length==1 && number2=="0" && value==Btn.n0) return;
      if(number2.isEmpty && value==Btn.n0) {
        if (value == Btn.dot && number2.contains(Btn.dot)) {
          return;
        }
        if (value == Btn.dot && number2.isEmpty || number2 == Btn.n0) {
          // number2="" | "0"
          value = "0.";
        }
      }

      number2 += value;

    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              // 1st part for output
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "$number1$operand$number2".isEmpty
                          ? "0"
                          : "$number1$operand$number2",
                      style:
                          TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.end,
                    )),
              ),
            ),

            // 2nd part for button
            Wrap(
              children: Btn.buttonValues
                  .map(
                    (value) => SizedBox(

                        //set different btn size using ternory operator
                        width: value == Btn.n0
                            ? screenSize.width / 2
                            : (screenSize.width / 4),
                        height: screenSize.width / 5,
                        child: buildButton(value)),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String value) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Material(
        // give different color using ternory operator:
        color: [Btn.del, Btn.clr].contains(value)
            ? Colors.blueGrey
            : [
                Btn.per,
                Btn.multiply,
                Btn.divide,
                Btn.add,
                Btn.subtract,
                Btn.calculate
              ].contains(value)
                ? Colors.orange
                : Colors.black87,

        clipBehavior: Clip.hardEdge,
        shape: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white24),
            borderRadius: BorderRadius.circular(100)),
        child: InkWell(
            onTap: () => onBtnTap(value),
            child: Center(
                child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ))),
      ),
    );
  }
}
