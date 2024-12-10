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
            horizontalListHeight: MediaQuery.sizeOf(context).height * 0.4,
            scrollPhysics: const BouncingScrollPhysics(),
            showPointer: true,
            itemSize: 21,
            lineColor: Colors.white,
            barUIBuilder: (totalCount, horizontal, lineColor, num interval) {
              return List.generate(
                totalCount + 1,
                (index) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: horizontal
                          ? multipleOfFive(index * (interval))
                              ? 60
                              : 24
                          : 1.5,
                      width: multipleOfFive(index * (interval)) ? 4 : 2,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                    Visibility(
                        visible: multipleOfFive(index * (interval)),
                        child: Text(index.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            )))
                  ],
                ),
              );
            },
            pointerColor: Colors.purple,
            customPointer: Container(
              height: 100,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(8),
              ),
              width: 10,
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
