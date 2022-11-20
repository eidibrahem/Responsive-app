import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentalhealth/main.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../shared/componants/componant.dart';

class Mobile extends StatelessWidget {
  Mobile(
    this.devicType,
  );
  DeviceType devicType;
  @override
  Widget build(BuildContext context) {
     print('${devicType}');
    return Column(
      children: [
        Column(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: buildCarouseItems(context, devicType)),
          ],
        ),
        MyDividor(),
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.grey[300],
              child: GridView.count(
                  shrinkWrap: true,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 1.0,
                  childAspectRatio: 1 / 1.4,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  children: List.generate(iconse.length,
                      (index) => BeuildGridItem(context, iconse[index]))),
            ),
          ),
        ),
      ],
    );
  }
}
