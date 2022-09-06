
import 'package:bloc_pattern_kisiler_app/repo/kisi_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiKayitCubit extends Cubit<void>{

  KisiKayitCubit() : super(0);

  var kisiRepo = KisiDatabase();
  Future<void> save(String kisi_name, String kisi_phone) async{
    await kisiRepo.save(kisi_name, kisi_phone);
  }

}