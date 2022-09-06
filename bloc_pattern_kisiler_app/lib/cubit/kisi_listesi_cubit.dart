
import 'dart:math';

import 'package:bloc_pattern_kisiler_app/models/kisi.dart';
import 'package:bloc_pattern_kisiler_app/repo/kisi_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiListesiCubit extends Cubit<List<Kisi>>{
  KisiListesiCubit() : super(<Kisi>[]);

  var kisiRepo = KisiDatabase();

  Future<void> kisileriGoster() async {
    var liste = await kisiRepo.getKisiler();
    emit(liste);
  }
  Future<void> arama(String arananKelime) async {
    var liste = await kisiRepo.aramaYap(arananKelime);
    emit(liste);
  }
  Future<void> sil(double kisi_id) async {
    await kisiRepo.kisiSil(kisi_id);
  }
}