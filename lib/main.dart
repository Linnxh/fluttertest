import 'package:flutter/material.dart';
import 'package:fluttertest/zzz_router/Tabs.dart';
import 'package:fluttertest/zzz_router/pages/form.dart';
import 'package:fluttertest/zzz_router/pages/form2.dart';
import 'package:fluttertest/zzz_router/pages/search.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = {
    '/form': (context) => FormPage(),
    '/search': (context, {arguments}) => SearchPage(arguments: arguments),
    // '/form2': (context, {arguments}) => Form2Page(),
  };

  /// **********
  /// 路由传参
  /// 命名 (最常用) | onGenerateRoute
  /// 非命名路由传参
  /// AS 调试flutter项目，需要根目录配置ndk路径，可直接点击debug按钮，如果是点的run按钮，可以使用flutter attach
  ///
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tabs(),
      routes: routes,
      onGenerateRoute: (RouteSettings settings) {
        final String? name = settings.name;
        print("=====================");
        print(name);
        if (name == '/form2') {
          var arguments = settings.arguments as FormArguments2;
          return MaterialPageRoute(builder: (BuildContext context) {
            return Form2Page(
                title: arguments.title, message: arguments.message);
          });
        }
        // final Function pageContentBuilder = routes[name] as Function;
        // if (settings.arguments != null) {
        //   return MaterialPageRoute(
        //       builder: (context) =>
        //           pageContentBuilder(context, arguments: settings.arguments));
        // } else {
        //   return MaterialPageRoute(
        //       builder: (context) => pageContentBuilder(context));
        // }
      },
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}

/// *********************************以上是有状态组件的用法 输入 stful*********************************
