import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Cubit/apiCubit/apicubit.dart';
import 'package:news/Cubit/apiCubit/apisates.dart';
import 'package:news/components/articleitem.dart';
import 'package:news/components/custome_text_form.dart';
import 'package:news/models/articlmodel.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchcontroller = TextEditingController();
    return BlocConsumer<Apicubit, Apistates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<Articlmodel> searchlist = Apicubit.myget(
          context,
        ).finalsearcharticles;
        if (state is Getsearchdatasuccesfully) {}

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Customeformfailed(
                  ontap: (value) {
                    Apicubit.myget(context).getsearchdtat(value);
                    Navigator.pop(context, true);
                  },
                  onchange: (value) {
                    if (value.length > 4) {
                      Apicubit.myget(context).getsearchdtat(value);
                    }
                  },
                  controller: searchcontroller,
                  hainttext: "searech here",
                  labletext: "Search",
                  perffixicon: Icon(Icons.search),
                  type: TextInputType.text,
                  validatior: (value) {
                    if (value == null) {
                      return "search must be empty";
                    } else {}
                  },
                ),
              ),
              Expanded(child: ArticleItemslist(searchlist)),
            ],
          ),
        );
      },
    );
  }
}
