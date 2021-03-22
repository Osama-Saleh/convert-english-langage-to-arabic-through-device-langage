import 'package:flutter/material.dart';
import 'package:convert_ar_en/info.dart';
import 'lang/applocale.dart';
// import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //..................................................................
  // String convData;
  // handleClick(String value) {
  //   setState(() {
  //     value = 'English';
  //   });
  //   if (value == 'English') {
  //     convData = 'Show Card';
  //   } else {
  //     convData = 'عرض البيانات';
  //   }

  //   switch (value) {
  //     case 'English':
  //       convData = 'Show Card';
  //       break;
  //     case 'Arabic':
  //       convData = 'عرض البيانات';
  //       break;
  //   }
  //   convData = value == 'English' ? 'Show Card' : 'عرض البيانات';
  // }
//..................................................................

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("TestApp")),
        //..................................................................
        // actions: <Widget>[
        //   PopupMenuButton<String>(
        //     onSelected: handleClick,
        //     itemBuilder: (BuildContext context) {
        //       return {'English', 'Arabic'}.map((String choice) {
        //         return PopupMenuItem<String>(
        //           value: choice,
        //           child: Text(choice),
        //         );
        //       }).toList();
        //     },
        //   ),
        // ],
        //..................................................................
      ),
      drawer: Drawer(),
      body: ListView.builder(
        itemBuilder: (ctx, index) => ListTile(
          leading: CircleAvatar(
            child: Text(data[index].age.toString()),
          ),
          title: Text(data[index].firstName + ' ' + data[index].lastName),
          subtitle: Text(data[index].mail),
          trailing: TextButton(
            child: Text(
              AppLocale.of(context).getTranslated('showKey'),
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            onPressed: () => showDialog(
              context: ctx,
              builder: (context) => Container(
                child: AlertDialog(
                  content: Text(
                      "${AppLocale.of(context).getTranslated('fullname')} : ${data[index].firstName}"
                      "${data[index].lastName}\n\n"
                      "${AppLocale.of(context).getTranslated('age')} : ${data[index].age.toString()}\n\n"
                      "${AppLocale.of(context).getTranslated('e-mail')} : ${data[index].mail}\n\n"
                      "${AppLocale.of(context).getTranslated('adress')} : ${data[index].address}"),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: Text(AppLocale.of(context).getTranslated('ok'))),
                  ],
                ),
              ),
            ),
          ),
        ),
        itemCount: data.length,
      ),
    );
  }
}
