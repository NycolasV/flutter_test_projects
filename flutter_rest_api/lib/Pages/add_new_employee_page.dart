import 'package:flutter/material.dart';
import 'package:flutter_rest_api/SettingsApi/rest_api.dart';

class AddNewEmployeePage extends StatefulWidget {
  final String employeeName;
  final String employeeAge;

  AddNewEmployeePage([this.employeeName = "", this.employeeAge = ""]);

  AddNewEmployeePageStatus createState() => AddNewEmployeePageStatus();
}

class AddNewEmployeePageStatus extends State<AddNewEmployeePage> {
  final _employeeNameController = TextEditingController();
  final _employeeAgeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if(widget.employeeName.isNotEmpty){
      _employeeNameController.text = widget.employeeName;
    }

    if(widget.employeeAge.isNotEmpty){
      _employeeAgeController.text = widget.employeeAge;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('New Employee'),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                CustomElements().patterForm(_employeeNameController, 'Employee Name'),
                CustomElements().patterForm(_employeeAgeController, 'Employee Age', TextInputType.number),
                CustomElements().patterButton(_formKey, 'SAVE', Colors.white,
                    Colors.purple, _onPressedButton),
              ],
            ),
          )),
    );
  }

  void _onPressedButton() {
    final body = {
      "name": _employeeNameController.text,
      "age": _employeeAgeController.text,
    };

    ApiService.addEmployees(body).then((success) {
      if (success) {
        showDialog(
          builder: (context) => AlertDialog(
            title: Text('Employee has been added!!!'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  _employeeNameController.text = '';
                  _employeeAgeController.text = '';
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
          context: context,
        );
      } else {
        showDialog(
          builder: (context) => AlertDialog(
            title: Text('Error when adding Employee...'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          ),
          context: context,
        );
      }
    });
  }
}

class CustomElements {
  TextFormField patterForm(controller, hintText,
      [keyboardType = TextInputType.text]) {
    return TextFormField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
        keyboardType: keyboardType,
        validator: (controller) {
          if (controller.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        });
  }

  RaisedButton patterButton(
      formKey, text, textColor, buttonColor, Function onPressed) {
    return RaisedButton(
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
      color: buttonColor,
      onPressed: () {
        if (formKey.currentState.validate()) {
          onPressed();
        }
      },
    );
  }
}
