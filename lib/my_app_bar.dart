import 'package:flutter/material.dart';
import 'package:drop_down_list/tools.dart';
import 'package:flutter/services.dart';

/// this is custom appbar widget
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor;
  final String title;
  final String centerTitle;
  final String backImg;
  final String actionName;
  final VoidCallback onPressed;
  final bool isBack;
  final Color titleColor;

  const MyAppBar(
      {Key key,
      this.backgroundColor,
      @required this.title,
      this.centerTitle: "",
      this.actionName: "",
      this.backImg,
      this.onPressed,
      this.isBack: true,
      this.titleColor})
      : assert(title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor;

    if (backgroundColor == null) {
      _backgroundColor = Utils.getBackgroundColor(context);
    } else {
      _backgroundColor = backgroundColor;
    }

    SystemUiOverlayStyle _overlayStyle =
        ThemeData.estimateBrightnessForColor(_backgroundColor) ==
                Brightness.dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      //可以不实用appbar，更改状态栏字体颜色
      value: _overlayStyle,
      child: Material(
        color: _backgroundColor,
        child: SafeArea(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      alignment: centerTitle.isEmpty ? Alignment.centerLeft : Alignment.center,
                      width: double.infinity,
                      child: Text(
                          title.isEmpty ? centerTitle : title,
                          style: TextStyle(
                            fontSize: 18,
                            color: titleColor,
                          )
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                    )
                  ],
                ),
                Offstage(
                  offstage: backImg==null,
                  child: IconButton(
                    onPressed: (){
                      FocusScope.of(context).unfocus();
                      Navigator.maybePop(context);
                    },
                    tooltip: 'Back',
                    padding: const EdgeInsets.all(12.0),
                    icon: Image.asset(
                      backImg,
                      color: _overlayStyle == SystemUiOverlayStyle.light ? Colors.green : Colors.black12,
                    ),
                  ),
                ),
                Positioned(
                  right: 0.0,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        buttonTheme: ButtonThemeData(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          minWidth: 60.0,
                        )
                    ),
                    child: actionName.isEmpty ? Container() :
                    FlatButton(
                      child: Text(actionName, key: const Key('actionName')),
                      textColor: _overlayStyle == SystemUiOverlayStyle.light ? Colors.green : Colors.black12,
                      highlightColor: Colors.transparent,
                      onPressed: onPressed,
                    ),
                  ),
                ),

              ],
            )
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(48.0);
}
