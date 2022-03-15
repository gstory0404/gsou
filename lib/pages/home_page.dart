import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gsou/entity/config_entity.dart';
import 'package:gsou/pages/search_widget.dart';
import 'package:gsou/pages/top_widget.dart';
import 'package:gsou/pages/topic_widget.dart';

/// @Author: gstory
/// @CreateDate: 2022/3/14 12:14 下午
/// @Email gstory0404@gmail.com
/// @Description: dart类作用描述

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ConfigEntity? _configEntity;

  @override
  void initState() {
    super.initState();
    _getConfigData().then((value) => {
          setState(() => {_configEntity = value})
        });
  }

  ///获取json配置
  Future<ConfigEntity> _getConfigData() async {
    String data = await rootBundle.loadString("assets/json/config.json");
    final jsonData = json.decode(data);
    return ConfigEntity.fromJson(jsonData);
  }

  @override
  Widget build(BuildContext context) {
    if (_configEntity == null) {
      return Container();
    }
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            _configEntity!.background!,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TopWidget(_configEntity!.top),
                  SearchWidget(_configEntity!.search),
                  TopicWidget(_configEntity!.topic),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
