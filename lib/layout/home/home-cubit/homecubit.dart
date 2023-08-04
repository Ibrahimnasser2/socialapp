



import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:review/models/login%20model.dart';
import 'package:review/moduels/home/chats.dart';
import 'package:review/moduels/home/mainpage.dart';
import 'package:review/moduels/home/posts.dart';
import 'package:review/moduels/home/users.dart';

import 'package:review/network/remote/dio_helper.dart';
import 'package:review/shared/constant/end_point.dart';


import '../../../moduels/home/settings.dart';
import 'homestates.dart';

class home_cubit extends Cubit<home_states>{
  home_cubit() : super( home_intial_state() );
  static home_cubit get(context)=> BlocProvider.of(context);

  int current_page=0;
  login_model?loginmodel;
  Color favor_colors=Colors.blue;
  Map<int,bool>favories_map={};
  bool is_favor=false;
  List<Widget> home_pages=[mainpage(), chats(), posts(),users(), settings()];
  List<BottomNavigationBarItem> bottomitem=[
    BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
    BottomNavigationBarItem(icon: Icon(Icons.chat),label: "chats"),
    BottomNavigationBarItem(icon: Icon(Icons.upload_file),label: "posts"),
    BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined),label: "users"),
    BottomNavigationBarItem(icon: Icon(Icons.settings),label: "settings"),

  ];

  void change_bottom_index({required int value}){
    if(value==2){
      emit(newpostpage_success_data_state());
    }
    else{
      current_page=value;
      emit(changehome_state());
    }

  }

  Future<void> get_users_data() async {
    emit(getusers_loading_data_state());
  await FirebaseFirestore.
   instance.
   collection("users").
   doc(token).get().
   then((value)  {

     loginmodel=login_model.fromJson(value.data()!);
      print(value.data());
      emit(getusers_success_data_state());


    }).catchError((error){
      print(error.toString());
      emit(getusers_fail_data_state(error.toString()));
    });

  }

  File? profileimage;
  File? coverimage;
  final picker = ImagePicker();

  Future getprofileImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileimage = File(pickedFile.path);
      emit(getprofileimage_success_data_state());
    } else {
      print('No image selected.');
      emit(getprofileimage_fail_data_state());
    }
  }
  Future getcoverimage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      coverimage = File(pickedFile.path);
      emit(getcoverimage_success_data_state());
    } else {
      print('No image selected.');
      emit(getcoverimage_fail_data_state());
    }}



































}