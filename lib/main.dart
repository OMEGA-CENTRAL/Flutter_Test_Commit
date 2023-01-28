import 'package:flutter/material.dart';
import 'theme.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

int random(int min, int max){
  return min + Random().nextInt(max-min);
}

List color = [Colors.black, Colors.red,
  Colors.orange, Colors.indigo, Colors.green,
  Colors.blueGrey, Colors.yellowAccent,Colors.tealAccent,
  Colors.lightGreen, Colors.pink, Colors.deepPurple,
];

var encapsulation = 1;
var colorForNumber = Colors.black;
var colorForSlider = Colors.blue;


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: usualTheme,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Что то очень простое"),
          centerTitle: true,

        ),
        body: const Center(
          child: easyCode(),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class easyCode extends StatefulWidget {
  const easyCode({Key? key}) : super(key: key);


  @override
  State<easyCode> createState() => _easyCodeState();
}

// ignore: camel_case_types
class _easyCodeState extends State<easyCode> {

  double valueSlider = 0;
  double valueSliderSize = 85;
  var value = 0;

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        Column(
          children: [

        Text(
          "$value",
          style: TextStyle(
            fontSize: valueSliderSize,
            color: colorForNumber,
            fontFamily: 'Anton',
          ),
        ),
        ElevatedButton(
            onPressed: () {
          setState(() {
            if (value + encapsulation <=9999999) {
              value += encapsulation;
            }
        });
          if (value + encapsulation >=9999999) {
            // ignore: deprecated_member_use
            Scaffold.of(context).showSnackBar(const SnackBar(
              content: Text('Слишком большое значение!', style: TextStyle(fontFamily: "Anton"),),
              duration: Duration(seconds: 1),
            ));
          }
          },

            child: Text("Прибавляет по $encapsulation")
        ),
        TextField(
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Прибавлять по:",
            fillColor: Colors.grey,
            filled: true,
          ),
          onSubmitted: (number) {
            encapsulation = int.tryParse(number)! ;
            setState(() {
            });
          },
        ),

            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Изменить размер",
                style: TextStyle(
                  fontSize: 40,
                    fontFamily: 'Roboto',

                ),
              ),
            ),
            Slider(
                value: valueSliderSize,
                max: 135,
                min: 35,
                divisions: 100,
                activeColor: colorForSlider,
                label: valueSliderSize.round().toString(),
                onChanged: (double localValueSize) {
                  setState(() {
                    valueSliderSize = localValueSize;
                    colorForSlider = color[random(0, color.length)];
                  });
                }
            ),

        SizedBox(
          height: 150,

            child: ListView.separated(
          itemCount: 11,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8),
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => setState(() {
                value += index;
              }),
              child: Card(
                color: color[random(1,color.length)],
                child: SizedBox(
                  width: 80,
                  child: Center(
                    child: Text(
                      "+$index",
                      style: const TextStyle(
                          fontSize: 45
                      ),
                    ),
                  ),
                )
              ),
            );
          },
        )),
        Slider(
            value: valueSlider,
            max: 100,
            min: -100,
            divisions: 4,
            label: valueSlider.round().toString(),
            onChanged: (double localValue) {
              setState(() {
                valueSlider = localValue;
              });
            }
        ),

        ElevatedButton(
            onPressed: () {
              setState(() {
                value += valueSlider.toInt();
              });
            },
            child: Text("Прибавить $valueSlider")
        ),
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Изменить цвет",
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: color.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () => setState(() {
                  colorForNumber = color[index];
                }),
                child: Card(
                  color: color[index],
                  child: const SizedBox(
                    width: 80,
                    child: Text(""),
                  ),
                ),
              );
            },

          ),
        ),

        Padding(
          padding: const EdgeInsets.only(top: 10, bottom:0, left:0, right:0),
          child: Image.asset('assets/my_image.jpg'),
        ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0.0),
              child: Image.asset('assets/my_gif.gif'),
            )

    ])










      ],
    );
  }
}

