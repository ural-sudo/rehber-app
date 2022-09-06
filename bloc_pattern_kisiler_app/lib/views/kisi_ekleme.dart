
import 'package:bloc_pattern_kisiler_app/cubit/kisi_kayit_cubit.dart';
import 'package:bloc_pattern_kisiler_app/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class KisiKayit extends StatefulWidget {
  const KisiKayit({Key? key}) : super(key: key);

  @override
  State<KisiKayit> createState() => _KisiKayitState();
}

class _KisiKayitState extends State<KisiKayit> {

  var tfPhone = TextEditingController();
  var tfName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kişi Kayıt"),
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
                  context.read<KisiKayitCubit>().save(tfName.text, tfPhone.text)
                  .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Anasayfa()));
                  });//Cubit
                },
                child: Text("Save")
            ),
          ],
        ),
      ),
    );
  }
}
