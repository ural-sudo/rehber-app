
import 'package:bloc_pattern_kisiler_app/cubit/kisi_listesi_cubit.dart';
import 'package:bloc_pattern_kisiler_app/views/kisi_detay.dart';
import 'package:bloc_pattern_kisiler_app/views/kisi_ekleme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/kisi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  bool isSearch = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<KisiListesiCubit>().kisileriGoster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:isSearch ? TextField(
          decoration: InputDecoration(
            hintText: "Sarch",
          ),
          onChanged: (searchingResult){
            context.read<KisiListesiCubit>().arama(searchingResult);
          },

        ) : Text('Kişi Listesi'),
        actions: [
          isSearch ? IconButton(onPressed: (){
            context.read<KisiListesiCubit>().kisileriGoster();
            setState((){
              isSearch = false;
            });
          }, icon: Icon(Icons.cancel)) :
              IconButton(onPressed: (){
                setState((){
                  isSearch = true;
                });
              }, icon: Icon(Icons.search))
        ],
      ),
      body: BlocBuilder<KisiListesiCubit,List<Kisi>>(
        builder: (context, kisiListesi){
          if(kisiListesi.isNotEmpty){
            return ListView.builder(
                itemCount: kisiListesi.length,
                itemBuilder: (context,index){
                  var kisi = kisiListesi[index];
                  return GestureDetector(
                    onTap: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=> KisiDetay(kisi: kisi)));
                    },
                    child: Card(
                      child: Row(
                        children: [
                          Text("${kisi.kisi_name}, ${kisi.kisi_phone}"),
                          Spacer(),
                          IconButton(onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text("${kisi.kisi_name} silinsin mi ?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: (){
                                      context.read<KisiListesiCubit>().sil(kisi.kisi_id);
                                      context.read<KisiListesiCubit>().kisileriGoster();
                                      print("Kişiyi sil : ${kisi.kisi_name}");
                                    },
                                  ),
                              ),

                            );
                          }, icon: Icon(Icons.delete))
                        ],
                      ),
                    ),
                  );
                }
            );
          }else{
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => KisiKayit()));
        },
      ),
    );
  }
}
