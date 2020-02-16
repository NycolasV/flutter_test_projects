import 'package:flutter/material.dart';
import 'package:flutter_rest_api/Pages/add_new_employee_page.dart';
import 'package:flutter_rest_api/SettingsApi/rest_api.dart';
import 'package:flutter_rest_api/Utils/sit_localizations.dart';

class EmployeeListPage extends StatefulWidget {
  @override
  _EmployeeListPageState createState() => _EmployeeListPageState();
}

class _EmployeeListPageState extends State<EmployeeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(SitLocalizations.of(context).title),
      ),
      body: FutureBuilder(
        future: ApiService.getEmployees(),
        builder: (context, snapshot) {
          final employees = snapshot.data;

          if (snapshot.connectionState == ConnectionState.done) {
            if (employees == null || snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('ERROR: ${snapshot.error}'),
                ),
              );
            }

            return ListView.separated(
              separatorBuilder: (context, index) {
                return Divider(
                  height: 2,
                  color: Colors.black,
                );
              },
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(employees[index]['employee_name']),
                  subtitle: Text('Age: ${employees[index]['employee_age']}'),
                  onTap: (){
                    // NOT WORK THIS WAY
//                    Navigator.pushNamed(context, '/addNewEmployee',
//                      arguments: <String, String>{
//                        'employeeName': employees[index]['employee_name'],
//                        'employeeAge': employees[index]['employee_age'],
//                      },
//                    );
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) => AddNewEmployeePage(employees[index]['employee_name'], employees[index]['employee_age'])
                  ));
                  },
                );
              },
              itemCount: employees.length,
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Increment',
        onPressed: () {
          Navigator.pushNamed(context, "/addNewEmployee");
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => AddNewEmployeePage(),
//            ),
//          );
        },
      ),
    );
  }
}