import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentalhealth/main.dart';

import '../shared/componants/componant.dart';

class Desktop extends StatelessWidget {
  Desktop(this.devicType, {Key? key}) : super(key: key);
  DeviceType devicType;
  @override
  Widget build(BuildContext context) {
     print('${devicType}');
    var height = MediaQuery.of(context).size.height;
    var orintation = MediaQuery.of(context).orientation;
    var width = MediaQuery.of(context).size.width;
    print(height);
    print('   ${width}');
    return Column(
      children: [
        Row(
          children: [
            Container(
                alignment: Alignment.topLeft,
                child: buildCarouseItems(context, devicType)),
            if (height <=1500 && width >=100)
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(child: buildCarouseItems(context, devicType)),
                  ],
                ),
              ),
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
                  crossAxisCount: 6,
                  children: List.generate(iconse.length,
                      (index) => BeuildGridItem(context, iconse[index]))),
            ),
          ),
        ),
      ],
    );
  }
}
