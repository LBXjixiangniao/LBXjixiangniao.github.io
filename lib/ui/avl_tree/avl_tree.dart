import 'dart:math';
import 'dart:ui';

import 'package:dart_tree/dart_tree.dart';
import 'package:flutter/material.dart';
import 'package:github_pages/styles/color_helper.dart';

class AVLTreeDebugPage extends StatefulWidget {
  @override
  _AVLTreeDebugPageState createState() => _AVLTreeDebugPageState();
}

class _AVLTreeDebugPageState extends State<AVLTreeDebugPage> {
  AVLTreeSet<int> treeSet = AVLTreeSet<int>();
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    // treeSet.debug = true;
    super.initState();
  }

  void createRandomTree(){
    treeSet.clear();
    Random random = Random();
    List.generate(28 + random.nextInt(8), (index) {
      treeSet.add(random.nextInt(3000));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AVL树验证'),
      ),
      body: Row(
        children: [
          Container(
            width: 100,
            child: Column(
              children: [
                Container(
                  height: 44,
                  alignment: Alignment.center,
                  child: Text(
                    '树节点数：${treeSet.length}',
                    style: TextStyle(fontSize: 14, color: Colors.red),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: TextField(
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                  ),
                ),
                FlatButton(
                  child: Text('增加'),
                  onPressed: () {
                    treeSet.add(int.parse(textEditingController.text));
                    setState(() {});
                  },
                ),
                FlatButton(
                  child: Text('删除'),
                  onPressed: () {
                    treeSet.remove(int.parse(textEditingController.text));
                    setState(() {});
                  },
                ),
                FlatButton(
                  child: Text('查找'),
                  onPressed: () {
                    treeSet.contains(int.parse(textEditingController.text));
                    setState(() {});
                  },
                ),
                FlatButton(
                  child: Text('打印树结构'),
                  onPressed: () {
                    treeSet.debugPrint();
                  },
                ),
                FlatButton(
                  child: Text('随机AVL树'),
                  onPressed: () {
                    setState(() {
                      createRandomTree();
                    });
                  },
                ),
                FlatButton(
                  child: Text('清除数据'),
                  onPressed: () {
                    setState(() {
                      treeSet.clear();
                    });
                  },
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
            child: Align(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  treeSet.treeStructureString(),
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SourceCodePro',
                    fontFeatures: [FontFeature.tabularFigures()],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}