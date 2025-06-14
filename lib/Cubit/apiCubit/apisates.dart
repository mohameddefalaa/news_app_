import 'package:news/components/articleitem.dart';
import 'package:news/models/articlmodel.dart';

abstract class Apistates {}

class Initialapistate extends Apistates {}

class Getbussinessdatasuccesfully extends Apistates {
  final List<Articlmodel> finalarticles;
  Getbussinessdatasuccesfully({required this.finalarticles});
}

class Getbussinessdatafailuer extends Apistates {
  String erroemessage;
  Getbussinessdatafailuer(this.erroemessage);
}

class Getbussinessdataloading extends Apistates {}

class Getsportsdatasuccesfully extends Apistates {
  final List<Articlmodel> finalarticles;
  Getsportsdatasuccesfully({required this.finalarticles});
}

class Getsportsdatafailuer extends Apistates {
  String erroemessage;
  Getsportsdatafailuer(this.erroemessage);
}

class Getsportsdataloading extends Apistates {}

class Getsciencedatasuccesfully extends Apistates {
  final List<Articlmodel> finalarticles;
  Getsciencedatasuccesfully({required this.finalarticles});
}

class Getsciencedatafailuer extends Apistates {
  String erroemessage;
  Getsciencedatafailuer(this.erroemessage);
}

class Getsciencedataloading extends Apistates {}

class Convertarticlefailuer extends Apistates {
  String erroemessage;
  Convertarticlefailuer(this.erroemessage);
}

class Toggelthem extends Apistates {}

class Getsearchdataloading extends Apistates {}

class Getsearchdatasuccesfully extends Apistates {
  final List<Articlmodel> finalarticles;
  Getsearchdatasuccesfully({required this.finalarticles});
}

class Getsearchdatafailuer extends Apistates {
  String erroemessage;
  Getsearchdatafailuer(this.erroemessage);
}
