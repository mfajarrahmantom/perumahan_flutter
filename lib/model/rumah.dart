class Rumah {
  String kdrumah;
  String jenisrumah;
  String lokasirumah;
  String harga;

  Rumah(
      {required this.kdrumah,
      required this.jenisrumah,
      required this.lokasirumah,
      required this.harga});

  factory Rumah.fromJson(Map<String, dynamic> rumah) => Rumah(
      kdrumah: rumah['kd_rumah'],
      jenisrumah: rumah['jenis_rumah'],
      lokasirumah: rumah['lokasi_rumah'],
      harga: rumah['harga']);
}
