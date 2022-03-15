/// @Author: gstory
/// @CreateDate: 2022/3/14 11:43 上午
/// @Email gstory0404@gmail.com
/// @Description: 配置信息

class ConfigEntity {
  String? webName;
  String? background;
  String? copyRight;
  List<Top>? top;
  List<Search>? search;
  List<Topic>? topic;

  ConfigEntity({this.webName,this.background, this.copyRight,this.top, this.search, this.topic});

  ConfigEntity.fromJson(Map<String, dynamic> json) {
    webName = json['webName'];
    background = json['background'];
    copyRight = json['copyRight'];
    if (json['top'] != null) {
      top = <Top>[];
      json['top'].forEach((v) {
        top!.add(Top.fromJson(v));
      });
    }
    if (json['search'] != null) {
      search = <Search>[];
      json['search'].forEach((v) {
        search!.add(Search.fromJson(v));
      });
    }
    if (json['topic'] != null) {
      topic = <Topic>[];
      json['topic'].forEach((v) {
        topic!.add(Topic.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['webName'] = webName;
    data['background'] = background;
    data['copyRight'] = copyRight;
    if (top != null) {
      data['top'] = top!.map((v) => v.toJson()).toList();
    }
    if (search != null) {
      data['search'] = search!.map((v) => v.toJson()).toList();
    }
    if (topic != null) {
      data['topic'] = topic!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Top {
  String? name;
  String? icon;
  String? link;

  Top({this.name, this.icon, this.link});

  Top.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['link'] = link;
    return data;
  }
}

class Search {
  String? name;
  String? hint;
  String? url;

  Search({this.name, this.hint, this.url});

  Search.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    hint = json['hint'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['hint'] = hint;
    data['url'] = url;
    return data;
  }
}

class Topic {
  String? name;
  String? icon;
  List<Data>? data;

  Topic({this.name, this.icon, this.data});

  Topic.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? icon;
  String? link;
  String? tips;

  Data({this.name, this.icon, this.link, this.tips});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    link = json['link'];
    tips = json['tips'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['icon'] = icon;
    data['link'] = link;
    data['tips'] = tips;
    return data;
  }
}

