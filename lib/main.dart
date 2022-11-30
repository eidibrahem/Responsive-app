import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_icon/shared/cubit/states.dart';

import 'layout/houme_layout.dart';
import 'moduls/icon.dart';
import 'shared/cubit/cubit.dart';

void main() {
  runApp(DevicePreview(builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..createDatabase()
              ..createDatabaseIcon()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
          builder: ((context, state) {
            var cubit = AppCubit.git(context);
            cubit.Media = MediaQuery.of(context);
            cubit.deviceType = getDeviceType(MediaQuery.of(context));
            return MaterialApp(
              title: 'Flutter Demo',
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: LayoutBuilder(
                builder: (context, constraints) {
                  return HomeLayout(getDeviceType(MediaQuery.of(context)));
                },
              ),
            );
          }),
          listener: ((context, state) {})),
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
