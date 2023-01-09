import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:perumahan_flutter/model/rumahread.dart';
import 'package:perumahan_flutter/model/customer.dart';

class ApiService {
  static const String baseUrl = 'http://127.0.0.1/perumahan_api/api/';

  Future<RumahRead> getRumah() async {
    final response = await http.get(Uri.parse("${baseUrl}rumah/read.php"));
    if (response.statusCode == 200) {
      return RumahRead.fromJson(json.decode(response.body));
    } else {
      throw Exception('gagal');
    }
  }

  Future<http.Response> createRumah(
      String jenisrumah, String lokasirumah, String harga) async {
    final response = await http.post(
      Uri.parse("${baseUrl}rumah/create.php"),
      body: jsonEncode(<String, String>{
        'jenis_rumah': jenisrumah,
        'lokasi_rumah': lokasirumah,
        'harga': harga,
      }),
    );
    return response;
  }

  Future<http.Response> createCustomer(Customer customer) async {
    final response = await http.post(
      Uri.parse("${baseUrl}customer/create.php"),
      body: jsonEncode(customer.toJson()),
    );
    return response;
  }
}
