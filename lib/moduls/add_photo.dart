import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_icon/main.dart';
import 'package:responsive_icon/shared/cubit/cubit.dart';

import '../shared/componant/componant.dart';
import '../shared/cubit/states.dart';

class AddPhoto extends StatelessWidget {
  const AddPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var formKey = GlobalKey<FormState>();
        File? profileImage;

        ImageProvider? mainImage;
        var titleController = TextEditingController();
        var dateController = TextEditingController();
        var cubit = AppCubit.git(context);
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.purple[300],
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              color: Colors.purple[100],
              padding: EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                      alignment: AlignmentDirectional.bottomCenter,
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 65,
                            backgroundColor: Theme.of(context).backgroundColor,
                            child: CircleAvatar(
                              radius: 60.0,
                              backgroundImage: cubit.getIamge(),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            radius: 20.0,
                            child: IconButton(
                              color: Colors.black,
                              onPressed: () {
                                cubit.gitProfileImage();
                              },
                              icon: Icon(
                                Icons.camera_alt,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormFieldX(
                              Controller: titleController,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'title must not be empty';
                                }
                              },
                              label: 'Task title ',
                              prefix: Icons.title,
                              color: Colors.amberAccent,
                              ontap: () {}),
                          SizedBox(
                            height: 15.0,
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          defaultFormFieldX(
                              Controller: dateController,
                              type: TextInputType.text,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'date must not be empty';
                                }
                              },
                              label: 'Task date ',
                              prefix: Icons.perm_contact_calendar_outlined,
                              color: Colors.amberAccent,
                              ontap: () {}),
                          SizedBox(
                            height: 15,
                          ),
                          defultbuttom(
                              function: () {
                                if (cubit.ProfileImage == null &&
                                    cubit.imgString == null) {
                                  ShowToast(
                                      text: 'you shoud select Image  ',
                                      state: ToastStates.ERROR);
                                } else {
                                  cubit.insertToDatabaseIcon(
                                      title: titleController.text,
                                      name: cubit.imgString!,
                                      data1: dateController.text);
                                }
                              },
                              text: 'imge')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
