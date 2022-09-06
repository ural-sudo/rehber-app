
class Kisi {
  late double kisi_id;
  late String kisi_name;
  late String kisi_phone;

  Kisi({required this.kisi_id, required this.kisi_name, required this.kisi_phone});

  factory Kisi.fromJson(Map<String, dynamic> json){
    return Kisi(kisi_id: json["kisi_id"], kisi_name: json["kisi_name"], kisi_phone: json["kisi_phone"]);
  }

}