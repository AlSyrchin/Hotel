import 'dart:math';

class Randomize {
  final int number;
  Randomize({
    required this.number,
  });
  int getNumber(){
    return Random().nextInt(number);
  }
}
