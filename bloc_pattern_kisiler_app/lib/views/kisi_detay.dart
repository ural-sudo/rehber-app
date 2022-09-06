
import 'package:bloc_pattern_kisiler_app/cubit/kisi_detay_c%C4%B1ubit.dart';
import 'package:bloc_pattern_kisiler_app/models/kisi.dart';
import 'package:bloc_pattern_kisiler_app/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KisiDetay extends StatefulWidget {
  late Kisi kisi;

  KisiDetay({required this.kisi});

  @override
  State<KisiDetay> createState() => _KisiDetayState();
}

class _KisiDetayState extends State<KisiDetay> {


  var tfPhone = TextEditingController();
  var tfName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    var kisi = widget.kisi;
    tfName.text = kisi.kisi_name;
    tfPhone.text = kisi.kisi_phone;
  }
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi detay"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfName,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfPhone,
                decoration: InputDecoration(
                  hintText: "Phone",
                ),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  print(widget.kisi.kisi_id);
                  context.read<KisiDetayCubit>().update(widget.kisi.kisi_id, tfName.text, tfPhone.text)
                  .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Anasayfa()));
                  });

                },
                child: Text("UPDATE")
            ),
          ],
        ),
      ),
    );
  }
}
