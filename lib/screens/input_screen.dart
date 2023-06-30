import './/components/appBar.dart';
import './/components/bottom_button.dart';
import './/components/card_gender.dart';
import './/components/number_picker.dart';
import './/components/patern_widget.dart';
import './/components/weight_widget.dart';
import './/constant.dart';
import './/screens/height_input.dart';
import 'package:flutter/material.dart';



enum Gender { male, female }
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

Gender? selectGender;

int age = 20;

double weight = 50;

void changeGender(Gender gender) {
  selectGender = gender;
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(child:  AppBarCustome(
        title: 'BMI Calculator',
      ), preferredSize: Size(double.infinity, 50)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            orangeColor,
            whiteColor,
          ], begin: Alignment.topCenter / 2, end: Alignment.bottomCenter),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            PaternCode(
              flex: 2,
              titleSection: 'Select Gender',
              childCard: Row(
                children: [
                  Expanded(
                      child: CardGender(
                    image: 'images/man.png',
                    title: 'Male',
                    onPressed: () {
                      setState(() {
                        changeGender(Gender.male);
                      });
                    },
                    fontWeight: selectGender == Gender.male
                        ? FontWeight.bold
                        : FontWeight.normal,
                    blur: selectGender == Gender.male ? 3.5 : 0,
                    colour: selectGender == Gender.male
                        ? Colors.black
                        : Colors.grey,
                  )),
                  Expanded(
                      child: CardGender(
                    image: 'images/woman.png',
                    title: 'Female',
                    onPressed: () {
                      setState(() {
                        changeGender(Gender.female);
                      });
                    },
                    fontWeight: selectGender == Gender.female
                        ? FontWeight.bold
                        : FontWeight.normal,
                    blur: selectGender == Gender.female ? 3.5 : 0,
                    colour: selectGender == Gender.female
                        ? Colors.black
                        : Colors.grey,
                  )),
                  
                ],
              ),
            ),
            PaternCode(
                flex: 2,
                titleSection: 'Age',
                childCard: NumberPickerSlider(
                  age: age,
                  onChanged: (value) {
                    setState(() {
                      age = value;
                    });
                  },
                )),
            PaternCode(
                flex: 3,
                titleSection: 'Weight',
                childCard: WeightWidget(
                  weightRate: (weightt) {
                    setState(() {
                      weight = weightt;
                    });
                  },
                  weight_title: weight,
                )),
            BottomButton(
              title: "Next",
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>HeightInput(weight: weight,)));
              }
            ),
          ],
        ),
      ),
    );
  }
}
