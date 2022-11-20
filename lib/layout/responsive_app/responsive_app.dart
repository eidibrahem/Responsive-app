import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mentalhealth/main.dart';
import 'package:mentalhealth/moduls/desktop.dart';
import 'package:mentalhealth/moduls/mobile.dart';
import 'package:mentalhealth/moduls/mobile_landscape.dart';

import '../../moduls/taplet.dart';

class ResponsiveLayout extends StatelessWidget {
  
  ResponsiveLayout(
    this.devicType,
  );
  DeviceType devicType;
  @override
  Widget build(
    BuildContext context,
  ) {
    Widget layout = Mobile(devicType);
    if (devicType == DeviceType.MobileLandscape) {

      layout = MobileLandscape(devicType);
    } else if (devicType == DeviceType.Desktop) {
      layout = Desktop(devicType);
    } else if (devicType == DeviceType.Tablet) {
      layout = Taplet(devicType);
    }

    return layout;
  }
}
