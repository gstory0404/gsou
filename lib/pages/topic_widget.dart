import 'package:flutter/material.dart';
import 'package:gsou/entity/config_entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// @Author: gstory
/// @CreateDate: 2022/3/14 3:27 下午
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class TopicWidget extends StatefulWidget {
  List<Topic>? topic;

  TopicWidget(this.topic, {Key? key}) : super(key: key);

  @override
  State<TopicWidget> createState() => _TopicWidgetState();
}

class _TopicWidgetState extends State<TopicWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 5,
      margin: const EdgeInsets.only(top: 50),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.topic!.length,
          itemBuilder: (context, index) {
            return _topic(widget.topic![index]);
          }),
    );
  }

  Widget _topic(Topic topic) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.only(bottom: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                itemIcon(topic.icon!),
                Container(
                  margin: const EdgeInsets.only(left: 6),
                  child: Text(
                    topic.name!,
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )
              ],
            ),
          ),
          Container(
            color: Colors.black12,
            height: 1,
            margin: const EdgeInsets.symmetric(vertical: 14),
          ),
          GridView.builder(
            shrinkWrap: true,
            itemCount: topic.data!.length,
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width ~/ 200,
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                childAspectRatio: 1.2),
            itemBuilder: (context, index) {
              return _item(topic.data![index]);
            },
          )
        ],
      ),
    );
  }

  Widget _item(Data data) {
    return Material(
      //背景色
      color: Colors.white,
      //shape圆角半径
      borderRadius: BorderRadius.circular(18.0),
      child: InkResponse(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(width: 1, color: Colors.black12),
              ),
              padding: const EdgeInsets.all(10),
              child: topicIcon(data.icon!),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                data.name!,
                style: const TextStyle(fontSize: 12, color: Colors.black),
              ),
            ),
          ],
        ),
        onTap: () async {
          if (await canLaunch(data.link!)) {
            await launch(data.link!);
          }
        },
        highlightColor: Colors.transparent,
        highlightShape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10.0),
        radius: 150.0,
        containedInkWell: true,
        splashColor: Colors.black12,
      ),
    );
  }

  Widget itemIcon(String url) {
    if (url.isEmpty) {
      return Container();
    }
    if (url.startsWith("http")) {
      return FadeInImage.assetNetwork(
        placeholder: "assets/images/logo.png",
        image: url,
        width: 18,
        height: 18,
        fit: BoxFit.fill,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/logo.png",
            width: 18,
            height: 18,
            fit: BoxFit.fill,
          );
        },
      );
    }
    return Image.asset("assets/images/$url",
        width: 18, height: 18, fit: BoxFit.fill);
  }

  Widget topicIcon(String url) {
    if (url.isEmpty) {
      return Image.asset("assets/images/logo.png",
          width: 30, height: 30, fit: BoxFit.fill);
    }
    if (url.startsWith("http")) {
      return FadeInImage.assetNetwork(
        placeholder: "assets/images/logo.png",
        image: url,
        width: 30,
        height: 30,
        fit: BoxFit.fill,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/logo.png",
            width: 30,
            height: 30,
            fit: BoxFit.fill,
          );
        },
      );
    }
    return Image.asset("assets/images/$url",
        width: 30, height: 30, fit: BoxFit.fill);
  }
}
