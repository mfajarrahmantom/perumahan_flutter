import 'package:flutter/material.dart';
import 'package:perumahan_flutter/api/api_service.dart';
import 'package:perumahan_flutter/model/rumah.dart';
import 'package:perumahan_flutter/model/rumahread.dart';
import 'package:perumahan_flutter/screen/rumah_create.dart';

class RumahList extends StatefulWidget {
  static const routeName = '/rumah_list';

  const RumahList({Key? key}) : super(key: key);

  @override
  State<RumahList> createState() => _RumahListState();
}

class _RumahListState extends State<RumahList> {
  late Future<RumahRead> _future;

  @override
  void initState() {
    super.initState();
    ApiService apiService = ApiService();
    _future = apiService.getRumah();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Agen Perumahan',
          style: TextStyle(color: Color.fromARGB(255, 9, 255, 198)),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: <Color>[
                Color.fromARGB(255, 255, 102, 92),
                Color.fromARGB(255, 255, 102, 196)
              ])),
        ),
      ),
      body: Center(
        child: FutureBuilder<RumahRead>(
          future: _future,
          builder: (context, snapshot) {
            var state = snapshot.connectionState;
            if (state != ConnectionState.done) {
              return const Center(child: CircularProgressIndicator());
            } else {
              if (snapshot.hasData) {
                final List<Rumah> rumahs = snapshot.data!.rumahs;
                return ListView.builder(
                    itemCount: rumahs.length,
                    itemBuilder: (context, index) {
                      return _buildRumahCard(context, rumahs[index]);
                    });
              } else if (snapshot.hasError) {
                return Center(child: Text("${snapshot.error}"));
              } else {
                return const Text('');
              }
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 91, 91),
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, RumahCreate.routeName);
        },
      ),
      backgroundColor: const Color.fromARGB(255, 225, 255, 224),
    );
  }

  Widget _buildRumahCard(BuildContext context, Rumah rumah) {
    return ListTile(
      subtitle: Text(rumah.lokasirumah),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      title: Text(
        rumah.jenisrumah,
      ),
      trailing: Text('Rp.${rumah.harga}'),
    );
  }
}
