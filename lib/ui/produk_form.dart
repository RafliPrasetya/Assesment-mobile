import 'package:flutter/material.dart';
import 'produk_detail.dart';

class ProdukForm extends StatefulWidget {
  const ProdukForm({Key? key}) : super(key: key);

  @override
  _ProdukFormState createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaTextboxController = TextEditingController();
  final _emailTextboxController = TextEditingController();
  final _phonenumberTextboxController = TextEditingController();
  final _IdNumberTextboxController = TextEditingController();
  final _AddressTextboxController = TextEditingController();
  DateTime? _selectedDate;
  bool _isChecked = false; // Untuk status checkbox

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PERSONAL FORM'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildTextField(_namaTextboxController, 'Full Name'),
            SizedBox(height: 16.0),
            _buildTextField(_emailTextboxController, 'Email'),
            SizedBox(height: 16.0),
            _buildTextField(_phonenumberTextboxController, 'Phone Number'),
            SizedBox(height: 16.0),
            _buildTextField(_IdNumberTextboxController, 'Personal ID Number'),
            SizedBox(height: 16.0),
            _buildTextField(_AddressTextboxController, 'Address'),
            SizedBox(height: 16.0),
            _textboxDate(),
            SizedBox(height: 16.0),
            _buildCheckbox(),
            Spacer(),
            _tombolSubmit(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    bool isPhoneNumber = label == 'Phone Number';

    return Card(
      elevation: 7,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                hintText: 'Enter $label',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(12),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isChecked ? Colors.blue : Colors.grey,
                  ),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter $label';
                }
                return null;
              },
            ),
          ),
          Visibility(
            visible: isPhoneNumber,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Verification'),
                      content: Text('Phone number is verified.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Verify'),
            ),
          ),
        ],
      ),
    );
  }

  Widget _textboxDate() {
    return Card(
      elevation: 7,
      child: InkWell(
        onTap: () {
          _selectDate(context);
        },
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Choose a Date',
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.all(12),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          child: Text(
            _selectedDate == null ? 'Select Date' : _selectedDate.toString(),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox() {
    return Card(
      elevation: 7,
      child: CheckboxListTile(
        title: Text(
          'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
        ),
        value: _isChecked,
        onChanged: (newValue) {
          setState(() {
            _isChecked = newValue!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  Widget _tombolSubmit() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate() && _isChecked) {
            String kodeProduk = _namaTextboxController.text;
            String Email = _emailTextboxController.text;
            String Address = _AddressTextboxController.text;
            String harga = _phonenumberTextboxController.text;
            String IdNumber = _IdNumberTextboxController.text;

            String Date = _selectedDate != null ? _selectedDate.toString() : '';

            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                PersonalData info = PersonalData(
                    kodeProduk, Email, IdNumber, IdNumber, Address);
                return ProdukDetail(
                  personal: info,
                );
              }),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            _isChecked ? Colors.blue : Colors.grey,
          ),
        ),
        child: const Text('SUBMIT'),
      ),
    );
  }
}
