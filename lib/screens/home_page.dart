import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:nbu_api/models/flag_models.dart';
import 'package:nbu_api/models/nbu_class.dart';
import 'package:nbu_api/utils/images.dart';

class NbuPage extends StatefulWidget {
  const NbuPage({Key? key}) : super(key: key);

  @override
  State<NbuPage> createState() => _NbuPageState();
}

class _NbuPageState extends State<NbuPage> {
  Future<List<NbuModel>?>? getResult;

  Future<List<NbuModel>> getData() async {
    String url = "https://nbu.uz/uz/exchange-rates/json/";

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List json = jsonDecode(response.body) as List;
      List<NbuModel> users = json.map((e) => NbuModel.fromJson(e)).toList();
      return users;
    }

    return List.empty();
  }

  @override
  void initState() {
    super.initState();

    getResult = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color(0xFFCBCBCB),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFFCBCBCB),
        title: const Text("Обменные курсы", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back_sharp,)),
        actions: [
          InkWell(
            onTap: () {},
            child: Icon(Icons.search,),
          ),
          SizedBox(width: 12,),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<NbuModel>?>(
          future: getResult,
          builder:
              (BuildContext context, AsyncSnapshot<List<NbuModel>?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                height: MediaQuery.of(context).size.height,
                child: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            if (snapshot.hasData) {
              List<NbuModel?>? users = snapshot.data;

              return ListView.builder(
                itemCount: NbuFlags.flags.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.asset(NbuFlags.flags[index].imageName),
                                ),
                                SizedBox(width: 5,),
                                Container(
                                  child: Text(
                                    users?[index]?.code ?? "No Data",
                                    style: TextStyle(),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  NbuFlags.flags[index].isCliked =! NbuFlags.flags[index].isCliked;                                      
                                });
                              },
                              child: Icon(NbuFlags.flags[index].isCliked ? Icons.notifications_active : Icons.notifications_active_outlined),
                            ),
                          ],
                        ),
                        Text(
                          (users?[index]?.title ?? 0).toString(),
                          style: TextStyle(),
                        ),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text("Курс ЦБ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                SizedBox(height: 5,),
                                Text(
                                  (users?[index]?.cbprice ?? 0).toString(),
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Покупка", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                SizedBox(height: 5,),
                                Text(
                                  (users?[index]?.nbubuyprice ?? 0).toString(),
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Продажа", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey),),
                                SizedBox(height: 5,),
                                Text(
                                  (users?[index]?.nbucellprice ?? 0).toString(),
                                  style: TextStyle(),
                                ),
                              ],
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}