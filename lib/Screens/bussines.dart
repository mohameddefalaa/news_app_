import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/Screens/error.dart';
import 'package:news/components/articleitem.dart';

class Bussiness extends StatelessWidget {
  const Bussiness({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Apicubit, Apistates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is Getbussinessdatasuccesfully) {
          return ArticleItemslist(state.finalarticles);
        } else if (state is Getbussinessdatafailuer) {
          return Errorscreen();
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.blueGrey),
          );
        }
      },
    );
  }
}
