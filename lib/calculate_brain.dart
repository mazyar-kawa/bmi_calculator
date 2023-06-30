import 'dart:math';

class CalculateBrain{
  CalculateBrain({required this.height ,required  this.weight});

  final double? height;

  final double? weight;


  


  double? _bmi;
  String getCalculateMBI(){
    _bmi = weight! / pow(height! / 100, 2);
    
    return _bmi!.toStringAsFixed(1);
  }

   String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi! >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }




}