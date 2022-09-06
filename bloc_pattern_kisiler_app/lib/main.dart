import 'package:bloc_pattern_kisiler_app/cubit/kisi_detay_c%C4%B1ubit.dart';
import 'package:bloc_pattern_kisiler_app/cubit/kisi_kayit_cubit.dart';
import 'package:bloc_pattern_kisiler_app/cubit/kisi_listesi_cubit.dart';
import 'package:bloc_pattern_kisiler_app/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => KisiKayitCubit()),
        BlocProvider(create: (context) => KisiDetayCubit()),
        BlocProvider(create: (context) => KisiListesiCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }

}

