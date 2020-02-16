import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rest_api/Pages/second_tab_page.dart';
import 'Pages/add_new_employee_page.dart';
import 'Pages/employee_list_page.dart';
import 'Pages/second_tab_page.dart';
import 'Utils/sit_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        const SitLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pt'),
      ],

      theme: ThemeData(primaryColor: Colors.red),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.format_list_bulleted)),
                Tab(icon: Icon(Icons.image)),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              EmployeeListPage(),
              SecondTabPage(),
            ],
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/addNewEmployee': (BuildContext context) => AddNewEmployeePage(),
      },
    );
  }
}
