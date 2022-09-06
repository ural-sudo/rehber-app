
import 'dart:convert';

import '../models/kisi.dart';
import 'package:http/http.dart' as http;

class KisiDatabase {



  Future<void> save(String kisi_name, String kisi_phone) async{
    var url = "http://10.0.2.2:8000/kisiler/post";
    Map<String,String> headers = {'Content-Type':'application/json'};
    var veri = jsonEncode({"kisi_name":kisi_name,"kisi_phone":kisi_phone});
    var response = await http.post(Uri.parse(url),headers: headers, body:veri);
    print(response);
  }
  Future<void> update(double kisi_id, String kisi_name, String kisi_phone) async {
    var url  = "http://10.0.2.2:8000/kisiler/patch";
    Map<String,String> headers = {"Content-Type" : "application/json"};
    var veri = jsonEncode({"kisi_id":kisi_id,"kisi_name": kisi_name, "kisi_phone":kisi_phone});
    var response = await http.post(Uri.parse(url),headers:headers, body: veri);
    print(response.body);
  }

  Future<List<Kisi>> getKisiler() async {
    var url = "http://10.0.2.2:8000/kisiler/get";
    var response = await http.get(Uri.parse(url));
    var decode = await jsonDecode(response.body);
    var array = await decode as List;
    List<Kisi> kisiListesi =  await array.map((e) => Kisi.fromJson(e)).toList();
    return kisiListesi;
  }

  Future<List<Kisi>> aramaYap(String kisi_name) async {

   var url = "http://10.0.2.2:8000/kisiler/search";
   Map<String,String> headers = {"Content-Type" : "application/json"};
   var veri = jsonEncode({"kisi_name": kisi_name});
   var response = await http.post(Uri.parse(url),headers: headers,body: veri);
   var decode = await jsonDecode(response.body);
   var array = await decode as List;
   List<Kisi> kisiListesi =  await array.map((e) => Kisi.fromJson(e)).toList();
   return kisiListesi;
  }

  Future<void> kisiSil(double kisi_id) async {
    var url = "http://10.0.2.2:8000/kisiler/delete";
    Map<String,String> headers = {"Content-Type" : "application/json"};
    var veri = jsonEncode({"kisi_id":kisi_id});
    var response = await http.delete(Uri.parse(url),headers:headers, body: veri);
    print(response.body);
  }
}