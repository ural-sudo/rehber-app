
import 'package:bloc_pattern_kisiler_app/repo/kisi_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiDetayCubit extends Cubit<void> {
  KisiDetayCubit() : super(0);

  var kisiRepo = KisiDatabase();
  Future<void> update(double kisi_id, String kisi_name, String kisi_phone) async {
    await kisiRepo.update(kisi_id,kisi_name,kisi_phone);
  }
}