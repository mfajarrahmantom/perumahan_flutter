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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Rumah',
          style: TextStyle(color: Color.fromRGBO(43, 205, 255, 1)),
        ),
        backgroundColor: const Color.fromARGB(255, 4, 134, 0),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          TextField(
            decoration: const InputDecoration(
              hintText: 'Tuliskan nama jenis rumah baru',
              labelText: 'Input Jenis Rumah',
            ),
            onChanged: (String value) {
              setState(() {
                _jenisrumah = value;
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
              apiService.createRumah(_jenisrumah);

              Customer customer = Customer(
                  kdpelanggan: '00103',
                  nama: 'Mariam',
                  tanggalbeli: '2022-12-12',
                  jeniskelamin: 'Wanita',
                  telp: '0872883717',
                  rumahkd: 100103);
              apiService.createCustomer(customer);
            },
          )
        ]),
      ),
      backgroundColor: const Color.fromARGB(255, 251, 207, 255),
    );
  }
}
