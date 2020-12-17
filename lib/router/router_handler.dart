import 'package:flutter/material.dart';
import 'package:github_pages/ui/avl_tree/avl_tree.dart';

class RouterHandler {
  static Map<String, Route<dynamic> Function(RouteSettings)> handlersMap = {
    'AVLTree': (RouteSettings setting) => MaterialPageRoute(
          builder: (context) => AVLTreeDebugPage(),
        ),
    'RedBlackTree': (RouteSettings setting) => MaterialPageRoute(
          builder: (context) => AVLTreeDebugPage(),
        ),
  };
}
