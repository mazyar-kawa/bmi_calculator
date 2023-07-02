import '/calculate_brain.dart';
import '/components/bottom_button.dart';
import '/components/card_container.dart';
import '/components/reusable_card.dart';
import '/constant.dart';
import 'result_page.dart';
import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}


int age=18;
int weight=56;
double height=170;

bool iscm=false;

bool ismale=false;


void changeCmToFt(bool uite){
if(!uite){
  height =height *30.48;
}else{
  height=height/30.48;
}
}



class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "BMI Calculator",
                style: text24Size,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        child: CardContainer(
                      childCard: ReusableCard(
                        title: "Age",
                        lableValue: age,
                        decrease: (){
                          setState(() {
                            age--;
                          });
                        },
                        increase: (){
                        setState(() {
                          age++;
                        });
                        },
                      ),
                    )),
                    Expanded(
                        child: CardContainer(
                      childCard: ReusableCard(
                        title: "Weight (Kg)",
                        lableValue: weight,
                        decrease: (){
                          setState(() {
                            weight--;
                          });
                        },
                        increase: (){
                        setState(() {
                          weight++;
                        });
                        },
                      ),
                    )),
                  ],
                ),
              ),
              Expanded(child: CardContainer(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Height",style: text20Size,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: greenColor.withAlpha(100),
                            ),
                            child: Row(
                              children: [
                                Text("cm",style: TextStyle(
                                  color: Colors.white,
                                ),),
                                Switch(
                                  inactiveThumbColor: greenColor.withOpacity(0.3),
                                  inactiveTrackColor: greenColor,
                                  activeColor: greenColor.withOpacity(0.3),
                                  activeTrackColor: greenColor,
                                  value: iscm, onChanged: (value) {
                                  setState(() {
                                    iscm = !iscm;
                                    changeCmToFt(iscm);
                                  });
                                },),
                                Text("ft",style: TextStyle(
                                  color: Colors.white,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                        decoration: BoxDecoration(
                          color: greenColor.withAlpha(100),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(onPressed: (){
                              setState(() {
                                height--;
                              });
                            }, child: Icon(Icons.arrow_downward,color: Colors.black,size: 30,)),
                            Text('${height.toStringAsFixed(2)}',style: lableText,),
                            TextButton(onPressed: (){
                              setState(() {
                                height++;
                              });
                            }, child: Icon(Icons.arrow_upward,color: Colors.black,size: 30,))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              )),
              Expanded(child: CardContainer(
                childCard: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Gender",style: text20Size,),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("I'm a",style: lableBigText,),
                          Row(
                                children: [
                                  Text("Male",style: TextStyle(
                                    color: ismale? Colors.black : greenColor,
                                  ),),
                                  Switch(
                                    inactiveThumbColor: greenColor.withOpacity(0.3),
                                    inactiveTrackColor: greenColor,
                                    activeColor: greenColor.withOpacity(0.3),
                                    activeTrackColor: greenColor,
                                    value: ismale, onChanged: (value) {
                                    setState(() {
                                      ismale = !ismale;
                                    });
                                  },),
                                  Text("Female",style: TextStyle(
                                    color: ismale? greenColor : Colors.black,
                                  ),),
                                ],
                              ),
                    
                      
                        ],
                      ),
                    )
                  ],
                )
              )),
              BottomButton(
                title: "CALCULATE",
                onPressed: (){
                  final result=CalculateBrain(height: height, weight: weight,isheightcm: iscm);
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>ResultPage(bmi: result.getCalculateMBI(), result: result.getResult(), interpretation: result.getInterpretation())));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}