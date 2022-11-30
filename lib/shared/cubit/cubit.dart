import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:math';
import '../../layout/houme_layout.dart';
import '../../main.dart';
import '../../moduls/icon.dart';
import '../componant/componant.dart';
import '../componant/utility/utility.dart';
import 'states.dart';
import 'dart:async';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit git(context) => BlocProvider.of(context);
  File? ProfileImage;
  String? imgString;
  final picker = ImagePicker();

  MediaQueryData? Media;

  DeviceType? deviceType;
  Future gitProfileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      ProfileImage = File(pickedFile.path);
      imgString = Utility.base64String(await ProfileImage!.readAsBytes());
      print(imgString);
      emit(SocialProfileImagepickedSuccessState());
    } else {
      print('no image selected ');
      emit(SocialProfileImagepickedErrorState());
    }
  }

  ImageProvider? mainImage;
  ImageProvider? getIamge() {
    if (ProfileImage != null) {
      mainImage = FileImage(ProfileImage!);
    } else {
      mainImage = NetworkImage(
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOaCb-EnuPC_eM4Cfog9_G4mYAIj1yKswPgwk0RWcM9NRIHKCY8_SyO3g7HMsYskjRyBU&usqp=CAU ');
      //https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOaCb-&usqp=CAU ';
    }
    return mainImage;
  }

  double getAngel(double lenth) {
    double angel = -pi / 2;

    if (lenth < 25) 
      angel+=((25 - lenth / 2)*.1);

    return angel;
  }

  late Database database;

  List<Map> tasks1 = [];
  List<Map> newTasks = [];
  List<Map> donTasks = [];
  List<Map> archivedTasks = [];

  void createDatabase() {
    openDatabase('todo.db', version: 1, onCreate: (database, version) async {
      print('db creat');
      database
          .execute(
              'CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT )')
          .then((value) {
        print('table created');
      }).catchError((onError) {
        print('error when creat${onError.toString()}');
      });
    }, onOpen: (database) async {
      await gitDataFromDatabase(database);
      print('db open ');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required String title,
    required String time,
    required String date,
  }) async {
    print('inserted successf');
    await database.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title ,date ,time, status)VALUES ("$title","$date","$time","new")')
          .then((value) async {
        print('${value}- inserted successfully');
        emit(AppInsertDatabaseState());
        await gitDataFromDatabase(database);
      }).catchError((error) {
        print(' erorre when Iserting ${error.toString()}');
      });
    }
        // await database.transaction((txn) async {
        //   int id1 = await txn.rawInsert(
        //       'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
        //   print('inserted1: $id1');
        //   int id2 = await txn.rawInsert(
        //       'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        //       ['another name', 12345678, 3.1416]);
        //   print('inserted2: $id2');
        // });
        );
  }

  gitDataFromDatabase(database) {
    newTasks = [];
    donTasks = [];
    archivedTasks = [];
    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          donTasks.add(element);
        else
          archivedTasks.add(element);
      });

      emit(AppGetDatabaseState());
    });
  }

  Color gets({
    required String status,
  }) {
    Color? color;
    if (status == 'archive') {
      color = Colors.amber[200];
      emit(AppCheckColorsState());
    } else if (status == 'done') {
      color = Colors.green;
      emit(AppCheckColorsState());
    } else {
      color = Colors.red[200];
    }

    return color!;
  }

  updateData({
    required String status,
    required int id,
  }) {
    database.rawUpdate('UPDATE tasks SET status =? WHERE id = ? ',
        ['$status', id]).then((value) {
      gitDataFromDatabase(database);
      emit(AppUpdateDatabaseState());
    });
  }

  deleteData({
    required int? id,
  }) {
    database.rawDelete('DELETE FROM $TABLE WHERE id = ? ', [id]).then((value) {
      gitDataFromDatabaseIcon(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState({
    required bool? isShow,
    required IconData? icon,
  }) {
    isBottomSheetShown = isShow!;
    fabIcon = icon!;
    emit(AppChangeBottomSheetState());
  }

  Future<File>? imgeFile;
  // DBHelper? dbHelper;
  List<photo> images = [];
  String ID = 'id';
  String NAME = 'photoName';
  String TABLE = 'photosTable';
  String DATA = 'data';
  String Title = 'title';
  String DB_Name = 'photos.db';
  // late Database database_1;

  void createDatabaseIcon() {
    openDatabase('${DB_Name}', version: 1, onCreate: (database, version) async {
      print('db creat');
      //('CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)');
      database
          .execute(
              'CREATE TABLE $TABLE($ID INTEGER PRIMARY KEY,$Title TEXT,$NAME TEXT,$DATA TEXT)')
          .then((value) {
        print('table created');
      }).catchError((onError) {
        print('error when creat${onError.toString()}');
      });
    }, onOpen: (database) async {
      await gitDataFromDatabaseIcon(database);
      print('db open ');
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabaseIcon({
    required String title,
    required String name,
    required String data1,
  }) async {
    print('inserted successf');
    await database.transaction((txn) async {
      txn /* .rawInsert(
              'INSERT INTO tasks(title ,date ,time, status)VALUES ("$title","$date","$time","new")')
          .*/
          .rawInsert(
              'INSERT INTO $TABLE($Title,$NAME,$DATA )VALUES ("$title","$name","$data1")')
          .then((value) async {
        print('${value}- inserted successfully');
        emit(AppInsertDatabaseState());
        await gitDataFromDatabaseIcon(database);
      }).catchError((error) {
        print(' erorre when Iserting ${error.toString()}');
      });
    }
        // await database.transaction((txn) async {
        //   int id1 = await txn.rawInsert(
        //       'INSERT INTO Test(name, value, num) VALUES("some name", 1234, 456.789)');
        //   print('inserted1: $id1');
        //   int id2 = await txn.rawInsert(
        //       'INSERT INTO Test(name, value, num) VALUES(?, ?, ?)',
        //       ['another name', 12345678, 3.1416]);
        //   print('inserted2: $id2');
        // });
        );
  }

  void showtToast() {
    ShowToast(text: 'you shoud select Image  ', state: ToastStates.ERROR);
  }

  gitDataFromDatabaseIcon(database) {
    images = [];
    emit(AppGetDatabaseLoadingState());
    database!.rawQuery('SELECT * FROM $TABLE').then((value) {
      value.forEach((element) {
        images.add(photo.fromMap(element));
        print(' 00000000${photo.fromMap(element).data}');
      });

      emit(AppGetDatabaseState());
    });
  }

  /*
  
///
 Widget gridView() {
    return Container(
      color: Colors.grey,
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: images?.map((photo) {
                print("photo name");
                print(photo.photoName);
                return Utility.imageFromBase64String(photo.photoName ?? "");
              }).toList() ??
              [Center(child: Text('data'))],
        ),
      ),
    );
  }

/////
///
  refreshImages() async {
    setState(() {
      // print('00001${images?.length}');

      /*dbHelper?.getPhotos().then((value) {
        setState(() {
          print('00000${images?.length}');
          images?.clear();
          images?.addAll(value);
          print('00000${images?.length}');
        });
      }).catchError((Error) {
        setState(() {
          print(Error.toString());
        });
      });*/
    });
///
 pickImageFromGallery() {
    ImagePicker().pickImage(source: ImageSource.gallery).then((imgFile) async {
      String imgString = Utility.base64String(await imgFile!.readAsBytes());
      print(imgString);
      photo photo1 = photo(2, imgString);
      dbHelper?.save(photo1);
      print('imgString');
      dbHelper?.getPhotos().then((value) {
        print('00001${images?.length}');
      }).catchError((error) {
        print(error.toString());
      });
    });
  }
  //DBHelper
   Database? _db;
   const String ID = 'id';
   const String NAME = 'photoName';
   const String TABLE = 'photosTable';
   const String DB_Name = 'photos.db';
  Future<Database?> get db async {
    if (null != _db) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_Name);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $TABLE ($ID INTEGER, $NAME TEXT)');
  }

  Future<photo> save(photo photo) async {
    var dbClient = await db;
   // print('5555${photo.photoName}');
    photo.id = await dbClient!.insert(TABLE, photo.toMap());
    print(photo.id);
    return photo;
  }

  Future<List<photo>> getPhotos() async {
    var dbClient = await db;

   // List<Map> maps = await dbClient!.query(TABLE, columns: [ID, NAME]);
    List<photo> photos = [];
   await _db?.rawQuery('SELECT * FROM ${TABLE}').then((value) {
      value.forEach((element) {
           photos.add(photo.fromMap(element));
      });
    });
// print("photos {{}}");
/* .rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new')
          newTasks.add(element);
        else if (element['status'] == 'done')
          donTasks.add(element);
        else
          archivedTasks.add(element);
      });


    if (maps.isNotEmpty) {
      for (int i = 0; i < maps.length; i++) {
        photos.add(photo.fromMap(Map<String, dynamic>.from(maps[i])));
      }
    }*/
    print("photos {{$photos}}");
    return photos;
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }

  //////////////////////////////////////////////

}
*/

}
