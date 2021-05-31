import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(GetMaterialApp(home: Home()));

class Controller extends GetxController {
  var leftDiceNumber = 1.obs;
  var rightDiceNumber = 2.obs;

  void dicechange() {
    leftDiceNumber.value = Random().nextInt(6) + 1;
    rightDiceNumber.value = Random().nextInt(6) + 1;
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text('Кости'),
        backgroundColor: Colors.black45,
      ),
      body: DicePage(),
    );
  }
}

class DicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              onPressed: () {
                c.dicechange();
              },
              child:
                  Obx(() => Image.asset('images/dice${c.leftDiceNumber}.png')),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                c.dicechange();
              },
              child:
                  Obx(() => Image.asset('images/dice${c.rightDiceNumber}.png')),
            ),
          ),
        ],
      ),
    );
  }
}
