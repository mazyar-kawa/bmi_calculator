import './/constant.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WeightWidget extends StatelessWidget {
  WeightWidget({
    super.key,
    required this.weightRate,
    required this.weight_title,
  });

  final double weight_title;
  final Function(double weight) weightRate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
            left: 130,
            bottom: 73,
            
            child: Container(
              width: 140,
              height: 65,
            
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
              )
            ),
          )),
          SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
              centerY: 0.65,
              interval: 20,
              labelFormat: '',
              onAxisTapped: (value) {
                weightRate(value);
              },
              minimum: 30,
              maximum: 220,
              startAngle: 180,
              endAngle: 360,
              pointers: <GaugePointer>[
                NeedlePointer(
                  value: weight_title,
                  onValueChangeStart: (value) {
                    weightRate(value);
                  },
                  enableDragging: true,
                  needleStartWidth: 1,
                  needleEndWidth: 5,
                  knobStyle: KnobStyle(
                    knobRadius: 0.05,
                    borderColor: Colors.black,
                    borderWidth: 0.02,
                    color: slatColor,
                  ),
                ),
              ],
            )
          ]),
          
          Positioned(
            bottom: 0,
            left: 170,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text("${weight_title.round()}",style: text24Size,),
                Text(" kg",style: TextStyle(
                  color: slatColor.withOpacity(0.5),
                  fontSize: 18
                ),),
              ],
            ))
        ],
      ),
    );
  }
}
