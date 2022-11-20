import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'layout/responsive_app/responsive_app.dart';

void main() {
  return runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var Media = MediaQuery.of(context);
    double width = Media.size.width;
    double height = Media.size.height;

    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      // title: 'Flutter',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter')),
        body: LayoutBuilder(
          builder: (context, constraints) {
            return ResponsiveLayout(getDeviceType(Media));
          },
        ),
      ),
    );
  }

  double getnumber(DeviceType deviceType) {
    if (deviceType == DeviceType.MobileLandscape) {
      return 4;
    } else if (deviceType == DeviceType.Tablet) {
      return 3;
    }
    if (deviceType == DeviceType.Desktop) {
      return 6;
    }

    return 2;
  }
}

enum DeviceType {
  Mobile,
  MobileLandscape,
  Tablet,
  Desktop,
}

/*
  //build app Withouut DevicePreview && When  MediaQuery error
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     var Media = MediaQuery.of(context);
    double width = Media.size.width;
    double height = Media.size.height;

    return Scaffold(appBar: AppBar(title: Text('Flutter')), body:  LayoutBuilder(
      builder: (context, constraints) {
        return ResponsiveLayout(getDeviceType(Media));
      },),
   
    );
  }
}*/
DeviceType getDeviceType(MediaQueryData mediaQuery) {
  Orientation orientation = mediaQuery.orientation;
  double width = mediaQuery.size.width;
  double height = mediaQuery.size.height;
  if (orientation == Orientation.landscape && height < 600) {
    width = mediaQuery.size.height;
    return DeviceType.MobileLandscape;
  } else {
    width = mediaQuery.size.width;
  }
  if (width >= 1300) {
    return DeviceType.Desktop;
  } else if (width >= 600) {
    return DeviceType.Tablet;
  }
  return DeviceType.Mobile;
}
