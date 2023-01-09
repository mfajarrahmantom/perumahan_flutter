import 'package:perumahan_flutter/model/rumah.dart';

class RumahRead {
  RumahRead({required this.success, required this.rumahs});

  bool success;
  List<Rumah> rumahs;

  factory RumahRead.fromJson(Map<String, dynamic> json) => RumahRead(
      success: json['success'],
      rumahs: List<Rumah>.from(json['data'].map((x) => Rumah.fromJson(x))));
}
