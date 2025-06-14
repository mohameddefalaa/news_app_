import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Cubit/appCubit/appcubir.dart';
import 'package:news/Cubit/appCubit/appstates.dart';
import 'package:news/Screens/serchscreen.dart';

class Homelayout extends StatelessWidget {
  const Homelayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Appcubit(BlocProvider.of<Apicubit>(context)),
      child: BlocConsumer<Appcubit, Appstates>(
        listener: (context, state) {},
        builder: (context, state) {
          Apicubit apicubit = Apicubit.myget(context);
          Appcubit appcubit = Appcubit.get(context);
          var isdark = Theme.of(context).brightness == Brightness.dark;

          return Scaffold(
            appBar: AppBar(
              title: Text(appcubit.titles[appcubit.currentindex]),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Searchscreen();
                        },
                      ),
                    ).then((onValue) {
                      if (onValue == true) {
                        if (appcubit.currentindex == 0) {
                          if (apicubit.finalbusinessarticles.isEmpty)
                            return apicubit.getbusinessdata();
                        } else {
                          apicubit.emit(
                            Getbussinessdatasuccesfully(
                              finalarticles: apicubit.finalbusinessarticles,
                            ),
                          );
                        }
                        if (appcubit.currentindex == 1) {
                          if (apicubit.finalsciencearticles.isEmpty) {
                            return apicubit.getsciencedata();
                          } else {
                            apicubit.emit(
                              Getsciencedatasuccesfully(
                                finalarticles: apicubit.finalsciencearticles,
                              ),
                            );
                          }
                        }
                        if (appcubit.currentindex == 2) {
                          if (apicubit.finalsportsarticles.isEmpty) {
                            return apicubit.getSportsdata();
                          } else {
                            apicubit.emit(
                              Getsportsdatasuccesfully(
                                finalarticles: apicubit.finalsportsarticles,
                              ),
                            );
                          }
                        }
                      }
                    });
                  },
                  icon: Icon(Icons.search),
                ),
                Switch(
                  activeColor: apicubit.thememode == ThemeMode.light
                      ? Colors.white
                      : Colors.black26,
                  value: Theme.of(context).brightness == Brightness.light,
                  onChanged: (onChanged) {
                    Apicubit.myget(context).toggelthem(appcubit.currentindex);
                  },
                ),
              ],
            ),
            bottomNavigationBar: ConvexAppBar(
              color: isdark ? Colors.white70 : Colors.white,

              curve: Curves.ease,
              backgroundColor: isdark ? Color(0xff393D3F) : Colors.blueGrey,
              style: TabStyle.react,
              items: appcubit.bottomnavitems,
              initialActiveIndex: appcubit.currentindex,
              onTap: (int i) {
                appcubit.changebottomnav(i);
              },
            ),

            body: appcubit.Screenes[appcubit.currentindex],
          );
        },
      ),
    );
  }
}
