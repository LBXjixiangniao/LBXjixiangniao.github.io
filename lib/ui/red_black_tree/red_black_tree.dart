// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as JS;
import 'dart:math';
import 'dart:ui';

import 'package:dart_tree/dart_tree.dart';
import 'package:flutter/material.dart';
import 'package:github_pages/styles/color_helper.dart';

class RedBlackTreeDebugPage extends StatefulWidget {
  @override
  _RedBlackTreeDebugPageState createState() => _RedBlackTreeDebugPageState();
}

class _RedBlackTreeDebugPageState extends State<RedBlackTreeDebugPage> {
  RedBlackTreeSet<int> treeSet = RedBlackTreeSet<int>();
  List<String> debugStringList = [];
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    treeSet.debug = true;
    treeSet.debugPrintMethod = (str) {
      debugStringList.add(str);
    };
    super.initState();
  }

  void createRandomTree() {
    treeSet.clear();

    Random random = Random();
    List.generate(36 + random.nextInt(8), (index) {
      treeSet.add(random.nextInt(3000));
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('红黑树验证'),
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
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: '请输入数字',
                        hintStyle: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
                  FlatButton(
                    child: Text('增加'),
                    onPressed: () {
                      int toAddInt = int.parse(textEditingController.text);
                      if (toAddInt is int) {
                        setState(() {
                          treeSet.add(toAddInt);
                        });
                      }
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
                    child: Text('随机红黑树'),
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
                  Spacer(),
                  Container(
                    color: Colors.red,
                    child: ListTile(
                      onTap: () {
                        JS.context.callMethod('open', ['https://github.com/LBXjixiangniao/dart_tree']);
                      },
                      title: Text('GitHub'),
                      subtitle: Text(
                        'dart的红黑树封装',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(
              width: 1,
              thickness: 1,
              color: ColorHelper.Black153,
            ),
            Expanded(child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView.builder(
                  reverse: true,
                  itemCount: debugStringList.length,
                  itemBuilder: (_, index) {
                    String text = debugStringList[debugStringList.length - 1 - index];
                    TextPainter painter = TextPainter(
                      textDirection: TextDirection.ltr,
                      text: TextSpan(
                        text: text,
                        style: TextStyle(
                          fontSize: 11,
                          fontFamily: 'SourceCodePro',
                        ),
                      ),
                    );
                    painter.layout();

                    return painter.width > constraints.maxWidth
                        ? Container(
                            height: painter.height,
                            child: EditableText(
                              readOnly: true,
                              controller: TextEditingController(text: text),
                              backgroundCursorColor: Colors.white,
                              cursorColor: Colors.white,
                              focusNode: FocusNode(),
                              style: TextStyle(
                                fontSize: 11,
                                fontFamily: 'SourceCodePro',
                              ),
                            ),
                          )
                        : Text(
                            text,
                            style: TextStyle(
                              fontSize: text.length > 10000 ? 11 : (text.length > 4000 ? 13 : 16),
                              fontFamily: 'SourceCodePro',
                            ),
                          );
                  },
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
