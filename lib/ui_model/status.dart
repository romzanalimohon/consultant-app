import 'dart:convert';

import 'package:consultancy_app/components/text_stile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Status extends StatefulWidget {
  const Status({Key? key}) : super(key: key);

  @override
  State<Status> createState() => _StatusState();
}

class _StatusState extends State<Status> {
  // Future getStatus() async{
  //
  //   final String response = await rootBundle.loadString('assets/trustdocument.json');
  //   final decode = await json.decode(response);
  //   setState(() {
  //
  //     data = decode;
  //     print(data);
  //   });
  // }

  var data;
  Future getData() async {
    var uri = Uri.parse('https://api.ticonsultancy.co.uk/api/getStatus');
    var response = await http.get(uri);
    setState(() {
      var decode = json.decode(response.body);
      data = decode;
      //print(data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'USA Student Visa Steps',
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                //shrinkWrap: true,
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
                        margin: EdgeInsets.only(left: 5, right: 5),
                        color: i%2 == 0? Colors.black12 : Colors.white10,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Step',
                              style: statusStile1(),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                color: i%2 == 0? Colors.white : Colors.black12,),
                              child: Center(
                                  child: Text(
                                data[i]['id'].toString(),
                                style: statusStile1(),
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            const VerticalDivider(
                              width: 20,
                              thickness: 1,
                              indent: 10,
                              endIndent: 40,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Flexible(
                              // height: 270,
                              // width: size.width * .62,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data[i]['name'].toString(),
                                    style: statusStile1(),
                                  ),
                                  Text(
                                    data[i]['description'].toString(),
                                    style: statusStile2(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,)
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
