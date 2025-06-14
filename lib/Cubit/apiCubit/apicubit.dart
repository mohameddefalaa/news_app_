import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Cubit/appCubit/appcubir.dart';
import 'package:news/Screens/sports.dart';
import 'package:news/models/articlmodel.dart';

class Apicubit extends Cubit<Apistates> {
  Apicubit() : super(Initialapistate());

  static Apicubit myget(context) => BlocProvider.of(context);
  List<Articlmodel> finalsportsarticles = [];
  List<Articlmodel> finalsciencearticles = [];
  List<Articlmodel> finalbusinessarticles = [];
  List<Articlmodel> finalsearcharticles = [];
  bool isScienceloaded = false;
  bool isSportsloaded = false;
  bool isBusinessloaded = false;
  ThemeMode thememode = ThemeMode.light;

  String baseurl = 'https://newsapi.org/v2';
  String query = 'top-headlines?';
  String apiKey = '81f04d5d501b4ae58ec35bbfe5c2a558';
  Future<dynamic> getbusinessdata() async {
    try {
      if (finalbusinessarticles.isNotEmpty) {
        emit(Getbussinessdatasuccesfully(finalarticles: finalbusinessarticles));
        return;
      }
      emit(Getbussinessdataloading());
      Dio dio = Dio();
      Response response = await dio.get(
        "${baseurl}/${query}category=business&apiKey=$apiKey",
      );
      List<dynamic> articlesjson = response.data["articles"];
      for (var article in articlesjson) {
        var onearticle = Articlmodel.fromjson(article);
        finalbusinessarticles.add(onearticle);
      }

      emit(Getbussinessdatasuccesfully(finalarticles: finalbusinessarticles));
    } on DioException catch (e) {
      emit(Getbussinessdatafailuer(e.toString()));
    } catch (e) {
      emit(Getbussinessdatafailuer(e.toString()));
    }
  }

  Future<dynamic> getSportsdata() async {
    try {
      if (finalsportsarticles.isNotEmpty) {
        emit(Getsportsdatasuccesfully(finalarticles: finalsportsarticles));
        return;
      }
      emit(Getsportsdataloading());
      Dio dio = Dio();
      Response response = await dio.get(
        "${baseurl}/${query}category=sports&apiKey=$apiKey",
      );
      List<dynamic> articlesjson = response.data["articles"];
      for (var article in articlesjson) {
        var onearticle = Articlmodel.fromjson(article);
        finalsportsarticles.add(onearticle);
      }

      emit(Getsportsdatasuccesfully(finalarticles: finalsportsarticles));
    } on DioException catch (e) {
      emit(Getsportsdatafailuer(e.toString()));
    } catch (e) {
      emit(Getsportsdatafailuer(e.toString()));
    }
  }

  Future<dynamic> getsciencedata() async {
    try {
      if (finalsciencearticles.isNotEmpty) {
        emit(Getsciencedatasuccesfully(finalarticles: finalsciencearticles));
        return;
      }
      emit(Getsciencedataloading());
      Dio dio = Dio();
      Response response = await dio.get(
        "https://newsapi.org/v2/top-headlines?category=science&apiKey=81f04d5d501b4ae58ec35bbfe5c2a558",
      );
      List<dynamic> articlesjson = response.data["articles"];
      for (var article in articlesjson) {
        try {
          var onearticle = Articlmodel.fromjson(article);
          finalsciencearticles.add(onearticle);
        } on Exception catch (e) {
          emit(Convertarticlefailuer(e.toString()));
        }
      }

      emit(Getsciencedatasuccesfully(finalarticles: finalsciencearticles));
      print(finalsciencearticles[0].title);
    } on DioException catch (e) {
      emit(Getsciencedatafailuer(e.toString()));
    } catch (e) {
      emit(Getsciencedatafailuer(e.toString()));
    }
  }

  void toggelthem(int index) {
    if (thememode == ThemeMode.light) {
      thememode = ThemeMode.dark;
    } else {
      thememode = ThemeMode.light;
    }
    switch (index) {
      case 0:
        getbusinessdata();
        break;
      case 1:
        getSportsdata();
        break;
      case 2:
        getsciencedata();
        break;
    }

    emit(Toggelthem());
  }

  Future<dynamic> getsearchdtat(String word) async {
    try {
      finalsearcharticles = [];
      Dio dio = Dio();
      Response response = await dio.get(
        "https://newsapi.org/v2/everything?q=$word&apiKey=81f04d5d501b4ae58ec35bbfe5c2a558",
      );
      List<dynamic> articlesjson = response.data["articles"];
      for (var article in articlesjson) {
        try {
          var onearticle = Articlmodel.fromjson(article);
          finalsearcharticles.add(onearticle);
        } on Exception catch (e) {
          emit(Convertarticlefailuer(e.toString()));
        }
      }

      emit(Getsearchdatasuccesfully(finalarticles: finalsearcharticles));
      print(finalsciencearticles[0].title);
    } on DioException catch (e) {
      emit(Getsearchdatafailuer(e.toString()));
    } catch (e) {
      emit(Getsearchdatafailuer(e.toString()));
    }
  }
}
