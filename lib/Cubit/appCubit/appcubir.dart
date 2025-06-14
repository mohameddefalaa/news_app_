import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Cubit/appCubit/appstates.dart';
import 'package:news/Screens/bussines.dart';
import 'package:news/Screens/science.dart';
import 'package:news/Screens/seetings.dart';
import 'package:news/Screens/sports.dart';

class Appcubit extends Cubit<Appstates> {
  Appcubit(this.apicubit) : super(AppinitialState());
  final Apicubit apicubit;
  bool isdarkmood = false;
  static Appcubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<String> titles = [
    'Bussiness News',
    'science News',
    'sports News',
    'Settings',
  ];
  List<Widget> Screenes = [Bussiness(), Science(), Sports(), Seetings()];

  List<TabItem> bottomnavitems = [
    TabItem(icon: Icon(Icons.business_outlined), title: 'Bussiness'),
    TabItem(icon: Icon(Icons.science), title: 'science'),
    TabItem(icon: Icon(Icons.sports_football_sharp), title: 'sports'),
    TabItem(icon: Icon(Icons.settings), title: 'Settings'),
  ];
  void changebottomnav(int i) {
    currentindex = i;
    if (currentindex == 0) {
      apicubit.getbusinessdata().then((value) {
        if (value is! Null) {
          apicubit.finalbusinessarticles = value;
        } else {}
      });
    } else if (currentindex == 1) {
      apicubit.getsciencedata().then((value) {
        if (value is! Null) {
          apicubit.finalsciencearticles = value;
        } else {}
      });
    } else if (currentindex == 2) {
      apicubit.getSportsdata().then((onValue) {
        if (onValue is! Null) {
          apicubit.finalsportsarticles = onValue;
        } else {}
      });
    }
    emit(Appnavbarstate());
  }
}
