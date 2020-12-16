import 'dart:js' as JS;

import 'package:flutter/material.dart';
import 'package:github_pages/router/router.dart';
import 'package:github_pages/styles/color_helper.dart';

import 'avl_tree/avl_tree.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 300,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    '李伯祥',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Divider(),
                ListTile(
                  onTap: () {
                    JS.context.callMethod('open', ['https://www.jianshu.com/u/e97e6a4fcd02']);
                  },
                  title: Text('简书'),
                  subtitle: Text('https://www.jianshu.com/u/e97e6a4fcd02'),
                ),
                Divider(),
                ListTile(
                  onTap: () {
                    JS.context.callMethod('open', ['https://github.com/LBXjixiangniao']);
                  },
                  title: Text('GitHub'),
                  subtitle: Text('https://github.com/LBXjixiangniao'),
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: ColorHelper.Black153,
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(context, RouterManager.routeForPage(page: AVLTreeDebugPage()));
                  },
                  title: Text('AVL树'),
                  subtitle: Text('https://github.com/LBXjixiangniao'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
