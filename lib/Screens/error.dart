import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Cubit/appCubit/appcubir.dart';
import 'package:news/Cubit/appCubit/appstates.dart';

class Errorscreen extends StatelessWidget {
  const Errorscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(BlocProvider.of<Apicubit>(context)),
      child: BlocBuilder<Appcubit, Appstates>(
        builder: (context, state) {
          Apicubit apicubit = BlocProvider.of(context);
          Appcubit appcubit = BlocProvider.of(context);

          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(height: 30),
                      Icon(
                        Icons.error_outline,
                        size: 200,
                        color: Colors.blueGrey,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Opps!",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          "We’re sorry. The page you requested",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      Text(
                        "could not be found.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          if (appcubit.currentindex == 0) {
                            apicubit.getbusinessdata();
                          } else if (appcubit.currentindex == 1) {
                            apicubit.getsciencedata();
                          } else if (appcubit.currentindex == 2) {
                            apicubit.getSportsdata();
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 240,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              "Reload News",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
