import 'package:flutter/material.dart';
import 'package:wheel_slider/wheel_slider.dart';

bool multipleOfFive(num n) {
  while (n > 0) {
    n = n - 5;
  }
  if (n == 0) {
    return true;
  }
  return false;
}

class WeightSelector extends StatefulWidget {
  const WeightSelector({Key? key}) : super(key: key);

  @override
  State<WeightSelector> createState() => _WeightSelectorState();
}

class _WeightSelectorState extends State<WeightSelector> {
  num value = 128;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Spacer(),
          WheelSlider(
            totalCount: 500,
            initValue: value,
            verticalListHeight: MediaQuery.sizeOf(context).height * 0.7,
            verticalListWidth: MediaQuery.sizeOf(context).height * 0.4,
            scrollPhysics: const BouncingScrollPhysics(),
            showPointer: true,
            pointerPositinFromTop: 110,
            pointerPositinFromStart: 50,
            horizontal: false,
            listWidth: MediaQuery.sizeOf(context).height * 0.2,
            lineColor: Colors.white,
            barUIBuilder: (totalCount, horizontal, lineColor, num interval) {
              return List.generate(
                totalCount + 1,
                (index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      width: multipleOfFive(index * (interval)) ? 70 : 24,
                      height: multipleOfFive(index * (interval)) ? 10 : 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Visibility(
                        visible: multipleOfFive(index * (interval)),
                        child: Container(
                          height: 10,
                          alignment: Alignment.topLeft,
                          margin: const EdgeInsetsDirectional.only(start: 5),
                          child: Text(index.toString(),
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1,
                              )),
                        ))
                  ],
                ),
              );
            },
            pointerColor: Colors.purple,
            customPointer: Container(
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 100,
            ),
            onValueChanged: (val) {
              setState(() {
                value = val;
              });
            },
            hapticFeedbackType: HapticFeedbackType.vibrate,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
