import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../single/themeSingle.dart';

class ExpandablePage extends StatefulWidget {
  @override
  _ExpandablePageState createState() => _ExpandablePageState();
}

class _ExpandablePageState extends State<ExpandablePage> {
  ThemeSingelManager themeSingelManager = ThemeSingelManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 236, 242,1),
      appBar: new AppBar(
        backgroundColor: themeSingelManager.getThemeColor(),
        title: Text('展开列表'),
        elevation: 0,
      ),
      body:ListView(
        children: <Widget>[
          Card1(),
          Card2(),
        ].map((w) {
          return Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15,),
            child: w,
          );
        }).toList(),
      ),
          
    );
  }
}

const loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class Card1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpandableNotifier(
        child: Column(
          children: <Widget>[
              SizedBox(
              height: 150.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.rectangle,
                  image: DecorationImage(image: AssetImage('images/IMG_4164.jpg'), fit: BoxFit.cover),
                ),
              ),
            ),
            ExpandablePanel(
              tapHeaderToExpand: true,
              header: Padding(
                padding: EdgeInsets.only(top: 10.0, left: 10),
                child: Text("Lorem ipsum",
                  style: Theme.of(context).textTheme.body2,
                )
              ),
              // collapsed: Text(loremIpsum, softWrap: false, overflow: TextOverflow.ellipsis,),
              // expanded: Text(loremIpsum, softWrap: true, overflow: TextOverflow.fade,),
              expanded: Column(
                children: <Widget>[
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                  Text('data'),
                ],
              ),
              builder: (_, collapsed, expanded) {
                return Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                  child: Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                  ),
                );
              },
            ),
          ],
        ),
      )
    );
  }
}

class Card2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    buildImg(String path, double height) {
      return SizedBox(
        height: height,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.rectangle,
            image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
          ),
        )
      );
    }

    buildCollapsed1() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Lorem Ipsum",
                  style: Theme.of(context).textTheme.body1,
                ),
              ],
            ),
          ),
        ]
      );
    }

    buildCollapsed2() {
      return buildImg('images/IMG_4164.jpg', 150.0);
    }

    buildCollapsed3() {
      return Container();
    }

    buildExpanded1() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Lorem Ipsum",
                  style: Theme.of(context).textTheme.body1,
                ),
                Text("Lorem Ipsum",
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ]
      );
    }

    buildExpanded2() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: buildImg('images/IMG_4164.jpg', 100.0)
              ),
              Expanded(
                child: buildImg('images/IMG_4164.jpg', 100.0)
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: buildImg('images/IMG_4164.jpg', 100.0)
              ),
              Expanded(
                child: buildImg('images/IMG_4164.jpg', 100.0)
              ),
            ],
          ),
        ],
      );
    }

    buildExpanded3() {
      return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod", softWrap: true,),
          ],
        ),
      );
    }


    return Card(
      clipBehavior: Clip.antiAlias,
      child: ExpandableNotifier(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expandable(
              collapsed: buildCollapsed1(),
              expanded: buildExpanded1(),
            ),
            Expandable(
              collapsed: buildCollapsed2(),
              expanded: buildExpanded2(),
            ),
            Expandable(
              collapsed: buildCollapsed3(),
              expanded: buildExpanded3(),
            ),
            Divider(height: 0.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    var exp = ExpandableController.of(context);
                    return MaterialButton(
                      child: Text(exp.expanded ? "COLLAPSE": "EXPAND",
                        style: Theme.of(context).textTheme.button.copyWith(
                          color: Colors.deepPurple
                        ),
                      ),
                      onPressed: () {
                        exp.toggle();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}