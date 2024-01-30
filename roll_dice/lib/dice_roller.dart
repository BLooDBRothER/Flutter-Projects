import 'dart:math';
import "package:flutter/material.dart";
import "package:roll_dice/styled_text.dart";

class DiceRoller extends StatefulWidget {
  const DiceRoller({
    super.key,
  });

  @override
  State<DiceRoller> createState() => _DiceRoller();
}

class _DiceRoller extends State<DiceRoller> {
  
  String activeImage = "assets/dice-images/dice-2.png";

  void rollDice() {
    setState(() {
      int randomDiceImageNumber = Random().nextInt(6) + 1;
      print(randomDiceImageNumber);
      activeImage = "assets/dice-images/dice-$randomDiceImageNumber.png";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              activeImage,
              width: 250,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: rollDice, 
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Color.fromARGB(255, 78, 234, 255))),
                child: const StyledText(text: "Roll")
              )
          ],
        );
  }
}
