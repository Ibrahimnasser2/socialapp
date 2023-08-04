
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:review/layout/home/home-cubit/homecubit.dart';
import 'package:review/layout/login/cubit/state.dart';
import 'package:review/network/remote/dio_helper.dart';
import 'package:review/shared/constant/end_point.dart';

import '../../../models/login model.dart';




class login_cubit extends Cubit<login_states>{
  login_cubit() : super( reg_intial_state() );
  static login_cubit get(context)=> BlocProvider.of(context);
  login_model? updatemodel;

  IconData? suff =Icons.visibility;
  bool ispass=true;



  void user_login({required String email,required String pass}){

    emit(login_loading_state());
    FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: pass).then(
            (value){

    token=value.user!.uid!;
          emit(login_success_state(id: value.user!.uid!));

        }).catchError((error){
      print(error.toString());
      emit(login_fail_state(error.toString()));
    });

  }

void user_register({required String email,required String pass,required String name,required String phone}){

  emit(reg_loading_state());
     FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: pass).then(
             (value){
               print(value.user!.email);
               create_user(
                   name:name,
                   email:email ,
                   phone: phone,
                   uid:value.user!.uid! ,

               );
               emit(login_success_state());


             }).catchError((error){
       print(error.toString());
               emit(reg_fail_state(error.toString()));
     });

}



  void create_user({required String email,required String uid,required String name,required String phone}){
    emit(create_user_loading_state());
    login_model  loginmodel=login_model(
        email:email,
        id: uid,
        name: name,
        phone:phone,
        bio: "write your bio.....",
        cover: "https://img.freepik.com/free-photo/optimism-wallpaper-with-smiley-face_23-2150039324.jpg?w=996&t=st=1691091422~exp=1691092022~hmac=dc6837391ce844c8e2583ab7d573feb9bb8dd60d103984c26521a5b542d2c9f2",
        isemailvalid: false,
      image: "https://img.freepik.com/free-photo/stylish-man-sitting-barbershop_1157-20487.jpg?w=996&t=st=1691010949~exp=1691011549~hmac=8d35eefcb7dba439c5ecab499fda4f9cb5003451e46cc1455bfd4cf533bcbd37"
    );

    emit(reg_loading_state());
    FirebaseFirestore.instance.collection("users").doc(uid).set(loginmodel!.tomap()).then(
            (value){
          emit(create_user_success_state());

        }).catchError((error){
      print(error.toString());
      emit(create_user_fail_state(error.toString()));
    });

  }







void password_cahnge(){
  ispass=!ispass;
  suff= ispass?  Icons.visibility:  Icons.visibility_off;
  emit(chang_pass_state());
}













}