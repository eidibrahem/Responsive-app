import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_icon/main.dart';
import 'package:responsive_icon/shared/componant/utility/utility.dart';
import 'package:sqflite/sqflite.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../moduls/add_photo.dart';
import '../moduls/icon.dart';
import '../shared/componant/componant.dart';
import '../shared/cubit/cubit.dart';
import '../shared/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  File? profileImage;

  var titleController = TextEditingController();
  var dateController = TextEditingController();

  HomeLayout(this.deviceType);
  DeviceType deviceType;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
      if (state is AppInsertDatabaseState) {
        Navigator.pop(context);
      }
    }, builder: (context, state) {
      var cubit = AppCubit.git(context);

      return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: Text(
            'Flutter',
          ),
          actions: [
            IconButton(
                onPressed: () {
                  print('rr');
                },
                icon: Icon(Icons.account_box_sharp))
          ],
        ), //Center(child: CircularProgressIndicator())
        body: state is! AppGetDatabaseLoadingState
            ? ResponsiveIcon( deviceType)
            : Center(child: CircularProgressIndicator()),

        //tasks.length>1?cubit.screens[cubit.currentIndex]: Center(child: CircularProgressIndicator()),

        floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigatTo(context, AddPhoto());
          },
          elevation: 20.0,
          backgroundColor: Colors.purple[300],
          child: Icon(cubit.fabIcon),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white38,
          currentIndex: 0,
          onTap: (index) {
            // setState(() {
            //   currentIndex=index;
            // });
          },
          elevation: 50.0,
          items: [
            BottomNavigationBarItem(
              icon: Text(''),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(''),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Text(''),
              label: '',
            ),
          ],
        ),
      );
    });
  }
}
