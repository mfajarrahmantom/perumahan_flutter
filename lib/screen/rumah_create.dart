import 'package:flutter/material.dart';
import 'package:perumahan_flutter/api/api_service.dart';
import 'package:perumahan_flutter/model/customer.dart';

class RumahCreate extends StatefulWidget {
  static const routeName = '/rumah_create';
  const RumahCreate({Key? key}) : super(key: key);

  @override
  State<RumahCreate> createState() => _RumahCreateState();
}

class _RumahCreateState extends State<RumahCreate> {
  String _jenisrumah = '';
  String _lokasirumah = '';
  String _harga = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Rumah',
          style: TextStyle(color: Color.fromARGB(255, 96, 218, 255)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[
                Color.fromARGB(255, 14, 172, 8),
                Color.fromARGB(255, 102, 255, 107)
              ])),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tuliskan jenis rumah baru',
              labelText: 'Input Jenis Rumah',
              icon: Icon(Icons.add_home_outlined),
            ),
            onChanged: (String value) {
              setState(() {
                _jenisrumah = value;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tuliskan lokasi rumah baru',
              labelText: 'Input Lokasi Rumah',
              icon: Icon(Icons.add_location_outlined),
            ),
            onChanged: (String value) {
              setState(() {
                _lokasirumah = value;
              });
            },
          ),
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tuliskan harga rumah baru',
              labelText: 'Input Harga Rumah',
              icon: Icon(Icons.attach_money_outlined),
            ),
            onChanged: (String value) {
              setState(() {
                _harga = value;
              });
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
            child: const Text(
              'Submit',
              style: TextStyle(color: Color.fromARGB(255, 111, 70, 243)),
            ),
            onPressed: () {
              ApiService apiService = ApiService();
              apiService.createRumah(_jenisrumah, _lokasirumah, _harga);

              Customer customer = Customer(
                  kdpelanggan: '00104',
                  nama: 'Parto',
                  tanggalbeli: '2022-12-29',
                  jeniskelamin: 'Pria',
                  telp: '0834354224',
                  rumahkd: 100107);
              apiService.createCustomer(customer);
            },
          )
        ]),
      ),
      backgroundColor: const Color.fromARGB(255, 254, 232, 255),
    );
  }
}
