import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
/*
    Map<String, dynamic> data =
    {
      // Map<String, Map<String, String>> '10%20%30%' 可以编辑
      '中途採用比率': {'前年度/2年度前/3年度前', '10%20%30%'},
      '中途採用比率2': {'前年度/2年度前/3年度前', '10%20%30%'},
      // Map<String, String> value(如：'18.5年') 可以编辑
      '正社員の平均継続勤務年数': '18.5年',
      '従業員の平均年齢': '50.5岁',
      '月平均所定外労働時間': '18時間',
      '平均の法定時間外労働60時間以上の労働者の数': '15人',
      // Map<String, List<Map<String, String>>> List<Map<String, String>> 可以编辑，可删除 Map<String, String>，并且可以无限增加 Map<String, String>
      '育児休業取得率（男性）': [
        {'正社員': '34%'},
        {'専門職': '50%'},
      ],
      '育児休業取得率（女性）': [
        {'正社員': '34%'},
        {'専門職': '50%'},
      ],
    };
     */
class MemberPage extends StatefulWidget {

  @override
  State<MemberPage> createState() => _MemberPage();
}

class _MemberPage extends State<MemberPage> {

  // 数据
  Map<String, dynamic> totalData = {};

  //
  List<Map<String, String>> manData = [];

  late TextEditingController _zhongOneTEC;
  late TextEditingController _zhongTwoTEC;
  late TextEditingController _zhongThreeTEC;
  late TextEditingController _peopleSelectTEC;
  late TextEditingController _childProfessionTEC;
  late TextEditingController _childRateTEC;

  Map<String, dynamic> data =
  {
    // Map<String, Map<String, String>> '10%20%30%' 可以编辑
    '中途採用比率': {'前年度/2年度前/3年度前': '10%20%30%'},
    '中途採用比率2': {'前年度/2年度前/3年度前': '10%20%30%'},
    // Map<String, String> value(如：'18.5年') 可以编辑
    '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5岁',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
    // Map<String, List<Map<String, String>>> List<Map<String, String>> 可以编辑，可删除 Map<String, String>，并且可以无限增加 Map<String, String>
    '育児休業取得率（男性）': [
      {'正社員': '34%'},
      {'専門職': '50%'},
    ],
    '育児休業取得率（女性）': [
      {'正社員': '34%'},
      {'専門職': '50%'},
    ],
  };

  List _listMan = [];
  List _listWoman = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _zhongOneTEC = new TextEditingController();
    _zhongTwoTEC = new TextEditingController();
    _zhongThreeTEC = new TextEditingController();
    _peopleSelectTEC = new TextEditingController();
    _childProfessionTEC = new TextEditingController();
    _childRateTEC = new TextEditingController();

    _listMan = data["育児休業取得率（男性）"];
    _listWoman = data["育児休業取得率（女性）"];
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _zhongOneTEC.dispose();
    _zhongTwoTEC.dispose();
    _zhongThreeTEC.dispose();
    _peopleSelectTEC.dispose();
    _childProfessionTEC.dispose();
    _childRateTEC.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
         title: Text("测试"),
      ),
      body: ListView(
        children: [

          // 中途1
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("中途採用\n   比率"),

                Text("前年底/2年度\n 前/3年度前"),

                InkWell(
                  onTap: () {
                    _showZhongTu(isOne: true);
                  },
                  child: DottedBorder(
              borderType: BorderType.Rect,
              radius: Radius.circular(10),
              // dashPattern: [20, 20,20,20],
              color: Colors.blue,
              strokeWidth: 1,
              child: Container(
                  width: 100,
                  color: Color.fromRGBO(232, 243, 254, 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${data["中途採用比率"]["前年度/2年度前/3年度前"]}'),

                      Image.asset("images/edit.png", width: 15,)
                    ],
                  )

              )
            ),
                ),
              ],
            ),

          ),

          // 中途2
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("中途採用2\n   比率"),

                Text("前年底/2年度\n 前/3年度前"),

                InkWell(
                  onTap: () {
                    _showZhongTu(isOne: false);
                  },
                  child: DottedBorder(
                      borderType: BorderType.Rect,
                      radius: Radius.circular(10),
                      // dashPattern: [20, 20,20,20],
                      color: Colors.blue,
                      strokeWidth: 1,
                      child: Container(
                          width: 100,
                          color: Color.fromRGBO(232, 243, 254, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${data["中途採用比率2"]["前年度/2年度前/3年度前"]}'),

                              Image.asset("images/edit.png", width: 15,)
                            ],
                          )

                      )
                  ),
                ),
              ],
            ),

          ),

          /*
              '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5岁',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
           */
          // 正社员平均服务年数
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("正社员平均服务年数"),

                InkWell(
                  onTap: (){
                    _showPeopleTime(intTime: 0);
                  },
                  child: DottedBorder(
                      borderType: BorderType.Rect,
                      radius: Radius.circular(10),
                      // dashPattern: [20, 20,20,20],
                      color: Colors.blue,
                      strokeWidth: 1,
                      child: Container(
                          width: 100,
                          color: Color.fromRGBO(232, 243, 254, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${data["正社員の平均継続勤務年数"]}'),

                              Image.asset("images/edit.png", width: 15,)
                            ],
                          )

                      )
                  ),
                ),
              ],
            ),

          ),

          // 从业员平均年龄
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text('従業員の平均年齢'),

                InkWell(
                  onTap: (){
                    _showPeopleTime(intTime: 1);
                  },
                  child: DottedBorder(
                      borderType: BorderType.Rect,
                      radius: Radius.circular(10),
                      // dashPattern: [20, 20,20,20],
                      color: Colors.blue,
                      strokeWidth: 1,
                      child: Container(
                          width: 100,
                          color: Color.fromRGBO(232, 243, 254, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${data["従業員の平均年齢"]}'),

                              Image.asset("images/edit.png", width: 15,)
                            ],
                          )

                      )
                  ),
                ),
              ],
            ),

          ),

          // 月平均所定外劳动时间
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("月平均所定外劳动时间"),

                InkWell(
                  onTap: () {
                    _showPeopleTime(intTime: 2);
                  },
                  child: DottedBorder(
                      borderType: BorderType.Rect,
                      radius: Radius.circular(10),
                      // dashPattern: [20, 20,20,20],
                      color: Colors.blue,
                      strokeWidth: 1,
                      child: Container(
                          width: 100,
                          color: Color.fromRGBO(232, 243, 254, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${data["月平均所定外労働時間"]}'),

                              Image.asset("images/edit.png", width: 15,)
                            ],
                          )

                      )
                  ),
                ),
              ],
            ),

          ),

          // 平均法定时间外60时劳动人数
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("平均法定时间外60时\n    劳动人数"),

                InkWell(
                  onTap: (){
                    _showPeopleTime(intTime: 3);
                  },
                  child: DottedBorder(
                      borderType: BorderType.Rect,
                      radius: Radius.circular(10),
                      // dashPattern: [20, 20,20,20],
                      color: Colors.blue,
                      strokeWidth: 1,
                      child: Container(
                          width: 100,
                          color: Color.fromRGBO(232, 243, 254, 1),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${data["平均の法定時間外労働60時間以上の労働者の数"]}'),

                              Image.asset("images/edit.png", width: 15,)
                            ],
                          )

                      )
                  ),
                ),
              ],
            ),

          ),

          // 育儿修业取得率男性
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("育儿修业\n取得率\n(男性)"),

                /*
                 List<Map<String, String>> _listData = [];
    if (isMan) {
      _listData = data["育児休業取得率（男性）"];
    } else {
      _listData = data["育児休業取得率（女性）"];
    }
                 */

                Container(
                  width: 250,
                  height: 110.0 * _listMan.length,
                  child: Column(
                    children: [

                      Expanded(
                        child: ListView.separated(
                            physics:  NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: [

                                  Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      DottedBorder(

                                          borderType: BorderType.Rect,
                                          radius: Radius.circular(10),
                                          // dashPattern: [20, 20,20,20],
                                          color: Colors.blue,
                                          strokeWidth: 1,
                                          child:
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              // height: 50,
                                              width: 250,
                                              color: Color.fromRGBO(232, 243, 254, 1),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${_listMan[index].keys.elementAt(0)}'),

                                                  Text('${_listMan[index].values.elementAt(0)}'),
                                                ],
                                              )

                                          )
                                      ),
                                    ],
                                  ),


                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: InkWell(
                                          onTap: () {
                                            _listMan.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Image.asset("images/delete.png", width: 20,))),
                                ],
                              );
                            }, separatorBuilder: (BuildContext context, int index){
                          return Divider();
                        }, itemCount: _listMan.length),
                      ),



                      SizedBox(height: 15,),
                      DottedBorder(
                          borderType: BorderType.Rect,
                          radius: Radius.circular(10),
                          // dashPattern: [20, 20,20,20],
                          color: Colors.blue,
                          strokeWidth: 1,
                          child: InkWell(
                            onTap: () {
                              _showChild();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                                width: 250,
                                // height: 50,
                                color: Color.fromRGBO(232, 243, 254, 1),
                                child: Center(
                                    child: Image.asset("images/add.png", width: 15,)
                                )

                            ),
                          )
                      ),
                    ],
                  ),
                )


              ],
            ),

          ),

          // 育儿修业取得率女性
          Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(color: Colors.grey,width: 1)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text("育儿修业\n取得率\n(女性)"),

                Container(
                  width: 250,
                  height: 110.0 * _listWoman.length,
                  child: Column(
                    children: [

                      Expanded(
                        child: ListView.separated(
                            physics:  NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index){
                              return Stack(
                                children: [

                                  Column(
                                    children: [
                                      SizedBox(height: 10,),
                                      DottedBorder(

                                          borderType: BorderType.Rect,
                                          radius: Radius.circular(10),
                                          // dashPattern: [20, 20,20,20],
                                          color: Colors.blue,
                                          strokeWidth: 1,
                                          child:
                                          Container(
                                              padding: EdgeInsets.all(10),
                                              // height: 50,
                                              width: 250,
                                              color: Color.fromRGBO(232, 243, 254, 1),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('${_listWoman[index].keys.elementAt(0)}'),

                                                  Text('${_listWoman[index].values.elementAt(0)}'),
                                                ],
                                              )

                                          )
                                      ),
                                    ],
                                  ),


                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: InkWell(
                                          onTap: () {
                                            _listWoman.removeAt(index);
                                            setState(() {});
                                          },
                                          child: Image.asset("images/delete.png", width: 20,))),
                                ],
                              );
                            }, separatorBuilder: (BuildContext context, int index){
                          return Divider();
                        }, itemCount: _listWoman.length),
                      ),



                      SizedBox(height: 15,),
                      DottedBorder(
                          borderType: BorderType.Rect,
                          radius: Radius.circular(10),
                          // dashPattern: [20, 20,20,20],
                          color: Colors.blue,
                          strokeWidth: 1,
                          child: InkWell(
                            onTap: () {
                              _showChild(isMan: false);
                            },
                            child: Container(
                                padding: EdgeInsets.all(10),
                                width: 250,
                                // height: 50,
                                color: Color.fromRGBO(232, 243, 254, 1),
                                child: Center(
                                    child: Image.asset("images/add.png", width: 15,)
                                )

                            ),
                          )
                      ),
                    ],
                  ),
                )



              ],
            ),

          ),

        ],
      )
    );

    /*
    //完全自定义弹框
  static Future showAllCustomDialog(
    BuildContext context, {
    Widget? child,
    bool clickBgHidden: false,
  }) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return CustomDialog(child: child, clickBgHidden: clickBgHidden);
        });
  }
     */
  }

  // 中途弹出框
  void _showZhongTu({bool isOne = true}) {

    /*
    以逗号分割的字符串转数组
list = string.split(',');
数组转以逗号分割的字符串
string = list.join(',');
     */
    List list = [];
    if (isOne) {
      list = data["中途採用比率"]["前年度/2年度前/3年度前"].split('%');
    } else {
      list = data["中途採用比率2"]["前年度/2年度前/3年度前"].split('%');
    }
    _zhongOneTEC.text = list[0];
    _zhongTwoTEC.text = list[1];
    _zhongThreeTEC.text = list[2];

    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            // 关键
            backgroundColor: Colors.black.withAlpha((255 * 0.4).toInt()),
            body: Center(
                child: Container(
                  width: 300,
                  height: 350,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Colors.grey,width: 1),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      // 中1
                      Center(child: Text("中途采用比率${isOne?"":"2"}",style: TextStyle(fontSize: 18, color: Colors.black, decoration: TextDecoration.none),)),
                      SizedBox(height: 10),
                      Text("前年度(单位 %)",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _zhongOneTEC,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          decoration: InputDecoration(
                              hintText: "前年度中途采用比率",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                      // 中2
                      Text("2年度前(单位 %)",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _zhongTwoTEC,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "2年度前中途采用比率",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                      // 中3
                      Text("3年度前(单位 %)",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _zhongThreeTEC,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          decoration: InputDecoration(
                              hintText: "3年度前中途采用比率",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),

                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);

                          if (_zhongOneTEC.text.length > 0 && _zhongTwoTEC.text.length > 0 && _zhongThreeTEC.text.length > 0) {
                            if (isOne) {
                              data["中途採用比率"]["前年度/2年度前/3年度前"] = "${_zhongOneTEC.text}%${_zhongTwoTEC.text}%${_zhongThreeTEC.text}";
                            } else {
                              data["中途採用比率2"]["前年度/2年度前/3年度前"] = "${_zhongOneTEC.text}%${_zhongTwoTEC.text}%${_zhongThreeTEC.text}";
                            }
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue
                          ),
                          child: Center(child: Text("确定",style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),)),

                        ),
                      ),

                    ],
                  ),
                )

            ),
          );
        });
  }

  // 人员时间弹出框
  void _showPeopleTime({int intTime = 0}) {
    /*
              '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5岁',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
           */
    String title = "";
    switch(intTime){
      case 0:
        //  正社员平均服务年数 从业员平均年龄 月平均所定外劳动时间 平均法定时间外60时劳动人数
        title = "正社員の平均継続勤務年数";
        _peopleSelectTEC.text = data["正社員の平均継続勤務年数"].toString().substring(0,data["正社員の平均継続勤務年数"].toString().length - 2);
        break;
      case 1:
        title = "従業員の平均年齢";
        _peopleSelectTEC.text = data["正社員の平均継続勤務年数"].toString().substring(0,data["正社員の平均継続勤務年数"].toString().length - 2);

        break;
      case 2:
        title = "月平均所定外労働時間";
        _peopleSelectTEC.text = data["正社員の平均継続勤務年数"].toString().substring(0,data["正社員の平均継続勤務年数"].toString().length - 4);

        break;
      case 3:
        title = "平均の法定時間外労働60時間以上の労働者の数";
        _peopleSelectTEC.text = data["正社員の平均継続勤務年数"].toString().substring(0,data["正社員の平均継続勤務年数"].toString().length - 2);

        break;
      default:
        title = "正社员平均服务年数";
        break;
    }

    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            // 关键
            backgroundColor: Colors.black.withAlpha((255 * 0.4).toInt()),
            body: Center(
                child: Container(
                  width: 300,
                  height: 180,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Colors.grey,width: 1),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [

                      Text("${title}",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _peopleSelectTEC,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          decoration: InputDecoration(
                              hintText: "${title}",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),

                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);

                          /*
              '正社員の平均継続勤務年数': '18.5年',
    '従業員の平均年齢': '50.5岁',
    '月平均所定外労働時間': '18時間',
    '平均の法定時間外労働60時間以上の労働者の数': '15人',
           */
                          if (_peopleSelectTEC.text.length > 0) {
                            switch(intTime){
                              case 0:
                                data["正社員の平均継続勤務年数"] = "${_peopleSelectTEC.text}年";
                                break;
                              case 1:
                                data["従業員の平均年齢"] = "${_peopleSelectTEC.text}岁";
                                break;
                              case 2:
                                data["月平均所定外労働時間"] = "${_peopleSelectTEC.text}时间";
                                break;
                              case 3:
                                data["平均の法定時間外労働60時間以上の労働者の数"] = "${_peopleSelectTEC.text}人";
                                break;
                              default:
                                break;
                            }

                          }
                          setState(() {});

                        },
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue
                          ),
                          child: Center(child: Text("确定",style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),)),

                        ),
                      ),

                    ],
                  ),
                )

            ),
          );
        });
  }

  // 育儿弹出框

  void _showChild({bool isMan = true}) {



    /*
    以逗号分割的字符串转数组
list = string.split(',');
数组转以逗号分割的字符串
string = list.join(',');
     */

    showDialog(
        context: context,
        builder: (context) {
          return Scaffold(
            // 关键
            backgroundColor: Colors.black.withAlpha((255 * 0.4).toInt()),
            body: Center(
                child: Container(
                  width: 300,
                  height: 350,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      // border: Border.all(color: Colors.grey,width: 1),
                      color: Colors.white
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children:  [
                      //
                      Center(child: Text("${isMan?"育児休業取得率（男性）":"育児休業取得率（女性）"}",style: TextStyle(fontSize: 18, color: Colors.black, decoration: TextDecoration.none),)),
                      SizedBox(height: 10),
                      // 职称
                      Text("职称",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _childProfessionTEC,
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          decoration: InputDecoration(
                              hintText: "职称",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),
                      // 率
                      Text("割合(单位 %)",style: TextStyle(fontSize: 15, color: Colors.black, decoration: TextDecoration.none),),
                      SizedBox(height: 10),
                      Container(
                        height: 40,
                        width: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Color.fromRGBO(247, 247, 247, 1)
                        ),
                        child: TextField(
                          controller: _childRateTEC,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: "割合",
                              hintStyle: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 14.0),
                              border: InputBorder.none
                          ),

                        ),
                      ),


                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);

                          if (_childProfessionTEC.text.length > 0 && _childRateTEC.text.length > 0 ) {
                            if (isMan) {
                              _listMan.add({_childProfessionTEC.text: _childRateTEC.text + "%"});
                            } else {
                              _listWoman.add({_childProfessionTEC.text: _childRateTEC.text + "%"});
                            }
                            setState(() {});
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue
                          ),
                          child: Center(child: Text("确定",style: TextStyle(fontSize: 17, color: Colors.white, decoration: TextDecoration.none),)),

                        ),
                      ),

                    ],
                  ),
                )

            ),
          );
        });
  }


}