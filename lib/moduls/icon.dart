import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_icon/shared/componant/componant.dart';
import 'package:responsive_icon/shared/componant/utility/utility.dart';
import 'package:responsive_icon/shared/cubit/cubit.dart';
import 'package:responsive_icon/shared/cubit/states.dart';

import '../main.dart';

//class ResponsiveIcon
class ResponsiveIcon extends StatelessWidget {
  ResponsiveIcon(this.deviceType);
  DeviceType deviceType;
  Widget build(BuildContext context) {
    // final width = (800 - 4 * 3) / 4;
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.git(context);
        double width = (cubit.Media!.size.width - 5) / 2;
        int s = 1;
        if (deviceType == DeviceType.MobileLandscape) {
          width = (cubit.Media!.size.width - 5) / 3;
          s = 2;
        }

        if (state is AppGetDatabaseLoadingState)
          return Center(child: CircularProgressIndicator());
        return SingleChildScrollView(
          child: Wrap(
            spacing: (15 * s).toDouble(),
            runSpacing: (10 * s).toDouble(),
            alignment: WrapAlignment.center,
            children: List.generate(
                cubit.images.length,
                (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: item(width, context, cubit.images[index], s: s),
                    )),
          ),
        );
      },
    );
  }
}
// gridView(cubit.images, context);