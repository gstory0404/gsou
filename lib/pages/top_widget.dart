import 'package:flutter/material.dart';
import 'package:gsou/entity/config_entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// @Author: gstory
/// @CreateDate: 2022/3/14 12:15 下午
/// @Email gstory0404@gmail.com
/// @Description: 标题栏列表

class TopWidget extends StatefulWidget {
  List<Top>? top;

  TopWidget(this.top, {Key? key}) : super(key: key);

  @override
  State<TopWidget> createState() => _TopWidgetState();
}

class _TopWidgetState extends State<TopWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 40,
      margin: const EdgeInsets.only(top: 30, left: 60, right: 60),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: false,
          reverse: false,
          itemCount: widget.top!.length,
          itemBuilder: (context, index) {
            return item(widget.top![index]);
          }),
    );
  }

  Widget item(Top top) {
    return InkWell(
      onTap: () async {
        if (await canLaunch(top.link!)) {
          await launch(top.link!);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            topIcon(top.icon!),
            Container(
              margin: const EdgeInsets.only(left: 2),
              child: Text(
                top.name!,
                style: const TextStyle(fontSize: 16, color: Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topIcon(String url) {
    if (url.isEmpty) {
      return Container();
    }
    if (url.startsWith("http")) {
      return FadeInImage.assetNetwork(
        placeholder: "assets/images/logo.png",
        image: url,
        width: 12,
        height: 12,
        fit: BoxFit.fill,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/logo.png",
            width: 12,
            height: 12,
            fit: BoxFit.fill,
          );
        },
      );
    }
    return Image.asset("assets/images/$url",
        width: 12, height: 12, fit: BoxFit.fill);
  }
}
