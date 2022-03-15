import 'package:flutter/material.dart';
import 'package:gsou/entity/config_entity.dart';
import 'package:url_launcher/url_launcher.dart';

/// @Author: gstory
/// @CreateDate: 2022/3/14 2:38 下午
/// @Email gstory0404@gmail.com
/// @Description: 搜索栏
///
class SearchWidget extends StatefulWidget {
  List<Search>? search;

  SearchWidget(this.search, {Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {

  int _chooseIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 5,
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Container(
            height: 36,
            margin: const EdgeInsets.only(left: 30),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.search!.length,
                itemBuilder: (context, index) {
                  return _searchItem(index,widget.search![index]);
                }),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerLeft,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              border: Border.all(width: 1, color: Colors.white),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: widget.search![_chooseIndex].hint,
                enabledBorder:const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder:const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              onSubmitted: (data) async{
                var url = "${widget.search![_chooseIndex].url}$data";
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchItem(int index,Search search) {
    return InkWell(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: index == _chooseIndex ? Colors.white : Colors.white70,
          borderRadius: const BorderRadius.only(topLeft:Radius.circular(6),topRight: Radius.circular(6)),
          border: Border.all(width: 1, color: Colors.white),
        ),
        child:Text(
          search.name!,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          ),
        ),
      ),
      onTap: () {
        setState(() {
          _chooseIndex = index;
        });
      },
    );
  }
}
