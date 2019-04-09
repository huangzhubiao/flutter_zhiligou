import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import '../single/themeSingle.dart';

class ExpandablePage extends StatefulWidget {
  @override
  _ExpandablePageState createState() => _ExpandablePageState();
}

class _ExpandablePageState extends State<ExpandablePage> {
  ThemeSingelManager themeSingelManager = ThemeSingelManager();
  List dataSource;

  @override
  void initState() {
    // TODO: implement initState
    dataSource = new List();
    for (var i = 0; i < 50; i++) {
      TestModel model =new TestModel(false, "text ${i}");
      dataSource.add(model);      
    }
  }

  void callback1(){

    print('111111111');
  }

  @override
  Widget build(BuildContext context) {
    double screenW =MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 236, 242,1),
      appBar: new AppBar(
        backgroundColor: themeSingelManager.getThemeColor(),
        title: Text('展开列表'),
        elevation: 0,
      ),
      body:ListView.builder(
        itemCount: dataSource.length,
        itemBuilder: (context,index){
          TestModel model =dataSource[index];
          return MyButton(
            title: Text(model.text),
            onPress: (){
              model.isExpand = !model.isExpand;
              print('${model.text}');
              setState(() {
                
              });
            },
            model: model,
          );
        },
      ),
          
    );
  }
}

const loremIpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

class TestModel {
  bool isExpand;
  String text;

  TestModel(bool isExpand,String text){
    this.isExpand =isExpand;
    this.text =text;
  }
}

class MyButton extends StatelessWidget {
  //callback
  @required VoidCallback onPress;
  Text title;
  Icon icon;
  double width;
  TestModel model;
  //constructor
  MyButton({this.onPress,this.title,this.icon,this.width,this.model});
  
  GestureDetector header(bool isExpand,double screenW){

    return GestureDetector(
              onTap: onPress,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.white,
                    width: screenW,
                    height: 56,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 8,
                          top: 8,
                          child: Image(
                            image: AssetImage('images/头像@2x.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Positioned(
                          left: 56,
                          top: 8,
                          child: Column(
                            children: <Widget>[
                              Text('上海行修',style: TextStyle(fontSize: 18.0),),
                              Text('5200000201'),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 8,
                          top: 8,
                          child: Image(
                            image: isExpand ? AssetImage('images/upss@2x.png'):AssetImage('images/downss@2x.png'),
                            height: 40,
                            width: 40,
                          ),
                        ),
                        Positioned(
                          right: 66,
                          top: 30,
                          child: Text('离线',style: TextStyle(fontSize: 12.0),),
                        )
                      ],
                    )
                  ),
                  Positioned(
                    bottom: 1,
                    right: 4,
                    left: 4,
                    child: Container(
                      color: Color.fromRGBO(1, 1, 1, 0.2),
                      height: 1,
                      width: screenW,
                    ),
                  )
                ],
              )
            );

  }

  @override
  Widget build(BuildContext context) {
    double screenW =MediaQuery.of(context).size.width;
    // TODO: implement build
    return new Container(
      width: screenW,
      child: model.isExpand ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: onPress,
              child: Stack(
                children: <Widget>[
                  header(true, screenW),
                  Positioned(
                    bottom: 1,
                    right: 4,
                    left: 4,
                    child: Container(
                      color: Color.fromRGBO(1, 1, 1, 0.2),
                      height: 1,
                      width: screenW,
                    ),
                  )
                ],
              )
            ),
            Container(
              height: 44,
              width: screenW,
              color: Color.fromRGBO(237, 236, 242,1),
              child: Text('data'),
            ),
            Container(
              height: 44,
              width: screenW,
              color: Color.fromRGBO(237, 236, 242,1),
              child: Text('data'),
            ),
          ],
        ) :header(false, screenW)
    );
  }
}

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