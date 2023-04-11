# gsou导航

Flutter开发静态导航网站 

## 配置信息
[assets/json/config.json](https://github.com/gstory0404/gsou/blob/master/assets/json/config.json)

```
{
  "webName": "gsou导航",//web名字
  "background": "https://cdn.pixabay.com/photo/2022/02/28/15/28/sea-7039471_960_720.jpg",//背景图片
  "copyRight": "",//底部版权 备案信息
  "top": [//顶部菜单栏
    {
      "name": "博客",//菜单名字
      "icon": "logo.png",//菜单图标
      "link": "https://www.gstory.cn" //跳转链接
    }
  ],
  "search": [//搜索栏
    {
      "name": "Google",//名字
      "hint": "Google搜索",//提示信息
      "url": "https://www.google.com.hk/search?q=" //搜索链接
    }
  ],
  "topic": [ //栏目
    {
      "name": "常用", //栏目名字
      "icon": "hot.png", //栏目图标
      "data": [
        {
          "name": "Gstory's Blog", //名称
          "icon": "", //图标
          "link": "https://www.gstory.cn", //跳转链接
          "tips": "Gstory的博客" //提示信息
        }
      ]
    }
  ]
}
```


## [Flutter部署到Github Action](https://blog.gstory.cn/archives/7.html)

## [Flutter通过Nginx部署到服务器](https://blog.gstory.cn/archives/40.html)
