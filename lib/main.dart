import 'package:flutter/material.dart';

import 'ui/avl_tree/avl_tree.dart';
import 'styles/color_helper.dart';
import 'styles/pingfang_textstyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline5: CustomTextStyle.h1,
            headline6: CustomTextStyle.h2,
            subtitle1: CustomTextStyle.h2,
            subtitle2: CustomTextStyle.body,
            bodyText1: CustomTextStyle.bodyBold,
            bodyText2: CustomTextStyle.body,
            caption: CustomTextStyle.captionLight,
          ),
          appBarTheme: AppBarTheme(
            elevation: 1,
            color: Colors.white,
            brightness: Brightness.light,
            iconTheme: IconThemeData(color: ColorHelper.Black51),
            actionsIconTheme: IconThemeData(color: ColorHelper.Black33),
            textTheme: TextTheme(
              button: CustomTextStyle.h2,
              headline6: CustomTextStyle.h1,
            ),
          ),
          dividerColor: ColorHelper.DividerColor,
          scaffoldBackgroundColor: ColorHelper.BGColor),
      // home: HomePage(),
      home: AVLTreeDebugPage(),
      onGenerateRoute: (settings) {
        print(settings);
        return null;
      },
    );
  }
}
