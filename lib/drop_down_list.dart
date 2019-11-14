import 'package:drop_down_list/list_item.dart';
import 'package:drop_down_list/vertical_line.dart';
import 'package:flutter/material.dart';
import 'package:drop_down_list/my_app_bar.dart';

class DropDownList extends StatefulWidget {
  final List<ListItem> items;
  final String title;
  final String indexString;
  final Color titleColor;
  final Color answerColor;
  final Color iconTextColor;
  final Color lineColor;
//  final AssetImage image;
//  final Image  iconImage;
  final String image;
  final String  iconImage;
  final String backImage;
  final Color barTitleColor;
  final MyAppBar bar;

  const DropDownList(
      {Key key,
      @required this.items,
      @required this.title,
        this.indexString,
        this.titleColor,
        this.answerColor,
        this.iconTextColor,
        this.lineColor,
        this.image,
        this.iconImage,
        this.backImage,
        this.barTitleColor,
        this.bar
     }
      ): assert(items.length > 0 && items != null),
        super(key: key);

  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.bar,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
              delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return _ListItems(index,widget.items);
              },
                childCount: widget.items.length

          ))
        ],

      ),
    );
  }


  Widget _ListItems(int index, List<ListItem> items) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: (() {
        setState(() {  //isOpen 为true时候 列表展开
          if (!items[index].isOpen) {
           items[index].isOpen = true;
//            heightLength = 2;
          } else {
//            heightLength = 22;
            items[index].isOpen = false;
          }
//            _setCurrentIndex(index, isVisible);
        });
      }),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 17, 22, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Stack(
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          width: 28,
                          height: 24,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.image),
                                fit: BoxFit.fill),
                          ),
                          child: Text(
                            items[index].title,
                            style: TextStyle(color: widget.iconTextColor, fontSize: 12),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Text(
                    "${items[index].title}",
                    style: TextStyle(color: widget.titleColor, fontSize: 15),
                  ),
                ),
                Expanded(flex: 1, child: Image.asset(widget.iconImage)
                )
              ],
            ),
          ),
          Offstage(
            offstage: !widget.items[index].isOpen,
            child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.fromLTRB(63, 0, 20, 17),
              child: RichText(
                  text: TextSpan(
                      text: '${widget.items[index].subTitle}',
                      style: TextStyle(color: widget.answerColor, fontSize: 12))),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: VerticalLine(
              dividerColor: widget.lineColor,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
