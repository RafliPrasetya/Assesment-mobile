import 'package:flutter/material.dart';

class PersonalData {
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? personalIdNumber;
  final String? address;

  const PersonalData(this.fullName, this.email, this.personalIdNumber,
      this.phoneNumber, this.address);
}

class ProdukDetail extends StatefulWidget {
  final PersonalData? personal;

  const ProdukDetail({Key? key, this.personal}) : super(key: key);

  @override
  _ProdukDetailState createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  final List<dynamic> list = [];

  @override
  void initState() {
    super.initState();
    if (widget.personal != null && !list.contains(widget.personal)) {
      list.add(widget.personal!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LIST PERSONAL DATA'),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          PersonalData personalData = list[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            elevation: 7,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    personalData.fullName ?? '',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Email: ${personalData.email ?? ''}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    personalData.address ?? '',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
