import "package:flutter/material.dart";
import "package:roll_dice/dice_roller.dart";

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
  });

  void rollDice() {
    // ignore: avoid_print
    print("rolled");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Color.fromARGB(255, 129, 218, 132), Color.fromARGB(255, 210, 227, 123)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: const Center(
        child: DiceRoller()
      ),
    );
  }
}


