import 'package:flutter/material.dart';
import 'package:fpa/shared/widgets/save.dart';
import 'package:fpa/shared/widgets/containers_list.dart';

class NewViewScreen extends StatefulWidget {
  @override
  _NewViewScreenState createState() => _NewViewScreenState();
}

class _NewViewScreenState extends State<NewViewScreen> {
  String aliasView = '';
  String viewUrl = '';
  int verificationNumber = 1;
  String verificationHour = '00:00';

  final TextEditingController aliasController = TextEditingController();
  final TextEditingController urlController = TextEditingController();
  final TextEditingController numberController = TextEditingController();

  List<String> hoursOfDay = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New View'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 16.0),
              Text(
                'Define Your Alias View',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              RoundedInputField(
                hintText: 'Define Your Alias View',
                controller: aliasController,
              ),
              SizedBox(height: 16.0),
              Text(
                'Your View URL',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              RoundedInputField(
                hintText: 'View URL',
                controller: urlController,
              ),
              SizedBox(height: 16.0),
              Text(
                'Verification Period',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8.0),
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: RoundedNumericInputField(
                      labelText: '<Number>',
                      controller: numberController,
                      onChanged: (value) {
                        setState(() {
                          verificationNumber = value != null && value.isNotEmpty
                              ? int.tryParse(value) ?? 1
                              : 1;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 60.0),
                  SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: RoundedDropdownButton(
                      value: verificationHour,
                      onChanged: (value) {
                        setState(() {
                          verificationHour = value.toString();
                        });
                      },
                      items: hoursOfDay
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      labelText: '',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 28.0),
              SizedBox(
                  height: 32.0), // Aumentei o espaçamento do botão Create View
              RoundedButton(
                onPressed: _saveNewView,
                text: 'Create View',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _saveNewView() {
    String aliasView = aliasController.text;
    String viewUrl = urlController.text;
    int verificationNumber = int.tryParse(numberController.text) ?? 1;
    String verificationHour = this.verificationHour;

    // Chama a função de salvar
    saveNewView(aliasView, viewUrl, verificationNumber, verificationHour);

    // Retorna para a tela anterior com os dados salvos
    Navigator.pop(
      context,
      ContainerItem(
        aliasView: aliasView,
        viewUrl: viewUrl,
        verificationNumber: verificationNumber,
        verificationHour: verificationHour,
      ),
    );
  }
}

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;

  const RoundedInputField({
    Key? key,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
      ),
    );
  }
}

class RoundedNumericInputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final ValueChanged<String?>? onChanged;

  const RoundedNumericInputField({
    Key? key,
    required this.labelText,
    required this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
      ),
      onChanged: onChanged,
    );
  }
}

class RoundedDropdownButton extends StatelessWidget {
  final String value;
  final ValueChanged<String?>? onChanged;
  final List<DropdownMenuItem<String>> items;
  final String labelText;

  const RoundedDropdownButton({
    Key? key,
    required this.value,
    required this.onChanged,
    required this.items,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      items: items,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const RoundedButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), // Alterado para 30.0
        ),
        padding:
            EdgeInsets.symmetric(vertical: 16.0), // Adicionado padding vertical
        backgroundColor: Colors.grey, // Alterado para cinza
      ),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16.0, color: Colors.white), // Cor do texto branca
      ),
    );
  }
}
