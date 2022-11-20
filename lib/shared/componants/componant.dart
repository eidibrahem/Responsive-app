import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mentalhealth/main.dart';

import '../../models/icon_model.dart';
import '../../moduls/icon_modul.dart';

Widget buildCarouseItems(context, DeviceType devicType) {
  var height = MediaQuery.of(context).size.width * .7;
  var width;
  if (devicType == DeviceType.MobileLandscape) {
    height = 130;
    width = 300.0;
  } else if (devicType == DeviceType.Mobile) {}
  return Container(
    constraints: BoxConstraints(
      maxWidth: width ?? 600,
      maxHeight: height,
    ),
    width: double.infinity,
    height: height,
    child: CarouselSlider(
        items: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('android/assets/images/bg-1.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('android/assets/images/gg.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('android/assets/images/on_boarding1.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('android/assets/images/on_boarding4.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage('android/assets/images/work.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
        ],
        options: CarouselOptions(
          height: height,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          scrollPhysics: NeverScrollableScrollPhysics(),
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        )),
  );
}

void navigatTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
IconModel icon_1 = IconModel(
  name: 'icon_1',
  icon: Icons.circle_notifications_outlined,
);
IconModel icon_2 = IconModel(
  name: 'icon_2',
  icon: Icons.circle_notifications_outlined,
);
IconModel icon_3 = IconModel(
  name: 'icon_3',
  icon: Icons.circle_notifications_outlined,
);
IconModel icon_4 = IconModel(
  name: 'icon_4',
  icon: Icons.circle_notifications_outlined,
);
IconModel icon_5 = IconModel(
  name: 'icon_5',
  icon: Icons.circle_notifications,
);
IconModel icon_7 = IconModel(
  name: 'icon_7',
  icon: Icons.circle_notifications,
);
IconModel icon_6 = IconModel(
  name: 'icon_6',
  icon: Icons.circle_notifications,
);
List<IconModel> iconse = [
  icon_1,
  icon_2,
  icon_3,
  icon_4,
  icon_5,
  icon_6,
  icon_7,
];
Widget BeuildGridItem(context, IconModel IconModel) => Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  IconModel.icon,
                  color: Colors.blue[500],
                  size: 60,
                ),
                Text('${IconModel.name}',
              style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
    );
Widget MyDividor() => Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.black,
      ),
    );
