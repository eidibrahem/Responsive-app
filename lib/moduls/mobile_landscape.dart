import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentalhealth/main.dart';
import 'package:mentalhealth/moduls/icon_modul.dart';

import '../shared/componants/componant.dart';

class MobileLandscape extends StatelessWidget {
  MobileLandscape(this.devicType, {Key? key}) : super(key: key);
  DeviceType devicType;
  @override
  Widget build(BuildContext context) {
    print('${devicType}');
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(children: [
            Container(
                alignment: Alignment.topLeft,
                child: buildCarouseItems(context, devicType)),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(child: buildCarouseItems(context, devicType)),
                ],
              ),
            ),
          ]),
          MyDividor(),
          Container(
            color: Colors.grey[300],
            child: GridView.count(
                shrinkWrap: true,
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
                childAspectRatio: 1 / 1.1,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                children: List.generate(iconse.length,
                    (index) => BeuildGridItem(context, iconse[index]))),
          ),
        ],
      ),
    );
  }
}
