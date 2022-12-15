import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_project/theme_changer/theme_notifier.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {

  bool switch_test = true;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifer>(
      builder: (context, ThemeNotifer themeNotifier, child){
        return SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //Navigator
              Card(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text("This is title 1"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    Divider(
                      thickness: 0.25,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text("This is title 2"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                    Divider(
                      thickness: 0.25,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text("This is title 3"),
                      trailing: Icon(Icons.navigate_next),
                    ),
                  ],
                ),
              ),
              //Switch
              Card(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: const Text("Change theme"),
                      trailing: Switch(
                        value: themeNotifier.isDark,
                        onChanged: (bool value){
                          themeNotifier.isDark = value;
                        },
                      ),
                    ),
                    Divider(
                      thickness: 0.25,
                      color: Colors.grey,
                    ),
                    ListTile(
                      title: const Text("Change setting 2"),
                      trailing: Switch(
                        value: switch_test,
                        onChanged: (bool value){
                          setState(() {
                            switch_test = value;
                            print(switch_test);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}



