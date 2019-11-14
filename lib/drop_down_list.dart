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
  final AssetImage image;
  final Image  iconImage;

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
        this.iconImage
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
      appBar: MyAppBar(title: widget.title),
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
//                          Image.asset("assets/ic_q&a.png"),
                      Container(
                          padding: EdgeInsets.only(top: 2, bottom: 2),
                          width: 28,
                          height: 24,
//                          decoration: BoxDecoration(
//                            image: DecorationImage(
//                                image: NetworkImage("https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=在线图标&hs=2&pn=6&spn=0&di=85800&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=118954934%2C2216329058&os=2969311207%2C1789446720&simid=3391506405%2C4241107173&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=在线图标&objurl=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F18%2F01%2F21%2F3aeb8729c16ab6bffa8c3c3403491c0e.jpg!%2Ffwfh%2F804x804%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue&fromurl=ippr_z2C%24qAzdH3FAzdH3Flafij3t_z%26e3Bv54AzdH3Ff7vwtAzdH3Fd8c90cm9_z%26e3Bip4s&gsm=&islist=&querylist="),
//                                fit: BoxFit.fill),
//                          ),
                          child: Text(
                            widget.indexString,
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
//                Expanded(flex: 1, child: Image.network("https://image.baidu.com/search/detail?ct=503316480&z=0&ipn=d&word=在线图标&hs=2&pn=6&spn=0&di=85800&pi=0&rn=1&tn=baiduimagedetail&is=0%2C0&ie=utf-8&oe=utf-8&cl=2&lm=-1&cs=118954934%2C2216329058&os=2969311207%2C1789446720&simid=3391506405%2C4241107173&adpicid=0&lpn=0&ln=30&fr=ala&fm=&sme=&cg=&bdtype=0&oriquery=在线图标&objurl=http%3A%2F%2Fbpic.588ku.com%2Felement_origin_min_pic%2F18%2F01%2F21%2F3aeb8729c16ab6bffa8c3c3403491c0e.jpg!%2Ffwfh%2F804x804%2Fquality%2F90%2Funsharp%2Ftrue%2Fcompress%2Ftrue&fromurl=ippr_z2C%24qAzdH3FAzdH3Flafij3t_z%26e3Bv54AzdH3Ff7vwtAzdH3Fd8c90cm9_z%26e3Bip4s&gsm=&islist=&querylist="))
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
