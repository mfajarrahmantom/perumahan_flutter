class Customer {
  String kdpelanggan;
  String nama;
  String tanggalbeli;
  String jeniskelamin;
  String telp;
  int rumahkd;

  Customer({
    required this.kdpelanggan,
    required this.nama,
    required this.tanggalbeli,
    required this.jeniskelamin,
    required this.telp,
    required this.rumahkd,
  });

  factory Customer.fromJson(Map<String, dynamic> customer) => Customer(
        kdpelanggan: customer['kd_pelanggan'],
        nama: customer['nama'],
        tanggalbeli: customer['tanggal_beli'],
        jeniskelamin: customer['jenis_kelamin'],
        telp: customer['telp'],
        rumahkd: customer['rumah_kd'],
      );

  Map<String, dynamic> toJson() {
    var data = {
      'kd_pelanggan': kdpelanggan,
      'nama': nama,
      'tanggal_beli': tanggalbeli,
      'jenis_kelamin': jeniskelamin,
      'telp': telp,
      'rumah_kd': rumahkd,
    };
    return data;
  }
}
