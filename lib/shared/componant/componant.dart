import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:responsive_icon/shared/componant/utility/utility.dart';

import '../../moduls/curve_text/curve_tet.dart';
import '../cubit/cubit.dart';

Widget item(double width, context, photo photo,{int s =1}) => Stack(
        
      alignment: Alignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(width / 2 - 20*s),
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
        ),
        Dismissible(
          key: Key(photo.id.toString()),
          onDismissed: ((direction) {
            AppCubit.git(context).deleteData(id: photo.id);
          }),
          child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                shape: BoxShape.circle),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 100, //width-20,

                    height: 100,

                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            alignment: Alignment.center,
                            fit: BoxFit.cover,
                            image: Utility.imageFromBase64String(
                                    photo.photoName.toString())
                                .image),
                        border: Border.all(color: Colors.black38),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Container(
                      width: width - 50,
                      height: width - 50,
                      child: Container(
                        width: width - 20,
                        height: width - 30,
                        child: Center(
                          child: ArcText(
                            key: Key(photo.id.toString()),
                            radius: (177.5/ 2) - 29,
                            text: '${photo.title}',
                            textStyle: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(overflow: TextOverflow.ellipsis),
                            startAngle:
                                getAngel(photo.title!.length.toDouble(), width),
                          ), //-pi / 2 +6.1

                          /*  Text('${photo.title}',maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        overflow: TextOverflow.ellipsis)),*/
                          /*CircularText(
                          position: CircularTextPosition.inside,
                          children: [
                            TextItem(
                                text: Text('${photo.title}'.toUpperCase(),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 50)),
                                space: 10,
                                direction:
                                    CircularTextDirection.anticlockwise,
                                startAngle: 50,
                                startAngleAlignment:
                                    StartAngleAlignment.center),
                          ],
                        )*/
                          /* Text('${photo.title}',maxLines: 1,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        overflow: TextOverflow.ellipsis)),*/
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
double getAngel(double lenth, double width) {
  print('55555$width');
  double angel = -pi / 2;
  double space = 0;
  if (lenth < 25) space = ((25 - lenth) * .13) / 2;

  return (angel + space);
}

Widget BeuildGridItem(context, photo photo) => Container(
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
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      Utility.imageFromBase64String(photo.photoName.toString())
                          .image),
              border: Border.all(color: Colors.black38),
              color: Colors.black12,
              shape: BoxShape.circle,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('${photo.title}',
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          ),
        ],
      ),
    );
Widget gridView(List<photo> Imges, BuildContext context) {
  return Container(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: List.generate(
              Imges.length,
              (index) => BeuildGridItem(
                    context,
                    Imges[index],
                  )),
        ),
      ));
}

void ShowToast({required String text, required ToastStates state}) =>
    Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: ChooseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Color ChooseToastColor(ToastStates? states) {
  Color color = Colors.grey;
  switch (states!) {
    case (ToastStates.SUCCESS):
      color = Colors.green;
      break;
    case (ToastStates.ERROR):
      color = Colors.red;
      break;
    case (ToastStates.WARNING):
      color = Colors.yellow;
      break;
  }
  return color;
}

enum ToastStates { SUCCESS, ERROR, WARNING }

void navigatTo(context, Widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));

Widget defultbuttom({
  double width = double.infinity,
  Color background = Colors.teal,
  required VoidCallback function,
  bool isUpperCase = true,
  String text = '',
  double borderRadius = 10,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: background,
      ),
      width: width,
      child: MaterialButton(
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: function,
      ),
    );

Widget defaultFormFieldX({
  required TextEditingController Controller,
  required TextInputType type,
  Function? onsubmit(String v)?,
  Function? onchanged(String v)?,
  VoidCallback? onpees,
  VoidCallback? ontap,
  TextStyle? style,
  required String? validator(String? v)?,
  String? label,
  IconData? prefix,
  IconData? suffix,
  bool ispass = false,
  Color? color,
}) =>
    TextFormField(
      style: style,
      controller: Controller,
      keyboardType: type,
      onFieldSubmitted: onsubmit,
      onTap: ontap,
      obscureText: ispass,
      onChanged: onchanged,
      validator: validator,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          prefixIcon: Icon(
            prefix,
          ),
          suffixIcon: IconButton(
            onPressed: onpees,
            icon: Icon(
              suffix,
            ),
          )),
    );


    /*
     onDismissed: (direction) {
        
         Dismissible
        AppCubit.git(context).deleteData(id: modle['id']);
      },
*/
