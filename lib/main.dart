import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Cubit/appCubit/appcubir.dart';
import 'package:news/constants.dart';
import 'package:news/layout/home_layout.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<Apicubit>(
      create: (context) => Apicubit()..getbusinessdata(),

      child: BlocConsumer<Apicubit, Apistates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.blueGrey),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
              primarySwatch: Colors.blueGrey,

              textTheme: TextTheme(
                headlineLarge: GoogleFonts.tajawal(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                titleMedium: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800],
                ),
                bodyMedium: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.black87,
                ),
                bodySmall: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),

              iconTheme: IconThemeData(color: Colors.white),

              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                actionsIconTheme: IconThemeData(color: Colors.white),
                color: Colors.blueGrey,
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            darkTheme: ThemeData(
              inputDecorationTheme: InputDecorationTheme(
                focusColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                labelStyle: Theme.of(context).textTheme.bodySmall,
                outlineBorder: BorderSide(color: Colors.white),
                prefixIconColor: Colors.white,
              ),
              iconTheme: IconThemeData(color: Colors.white),
              textTheme: TextTheme(
                bodySmall: TextStyle(color: Colors.white, fontSize: 16),
                bodyMedium: TextStyle(color: Colors.white),
                titleLarge: TextStyle(color: Colors.white, fontSize: 18),
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                actionsIconTheme: IconThemeData(color: Colors.white),
                color: Color(0xff393D3F),
                titleTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),

              scaffoldBackgroundColor: Color(0xff393D3F),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Color(0xff393D3F),
              ),
            ),
            themeMode: Apicubit.myget(context).thememode,
            home: Homelayout(),
          );
        },
      ),
    );
  }
}
