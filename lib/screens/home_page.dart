import 'package:flutter/material.dart';
import 'package:nbu_api/data/models/flag_models.dart';
import 'package:nbu_api/view_model/nbu_view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Future.microtask(() => 
    context.read<NbuViewModel>().fetchNbuData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor:  const Color(0xFFCBCBCB),
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: const Color(0xFFCBCBCB),
        title: const Text("Обменные курсы", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),),
        leading: InkWell(
          onTap: () {},
          child: const Icon(Icons.arrow_back_sharp,)),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(Icons.search,),
          ),
          const SizedBox(width: 12,),
        ],
      ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          Consumer<NbuViewModel>(builder: (context, nbuViewModel, child) {
            return nbuViewModel.isLoading
                ? const Center(child: CircularProgressIndicator())
                : (nbuViewModel.data.isEmpty
                    ? const Text("Hozircha malumot yo'q")
                    : Expanded(
                      child: ListView.builder(
                          itemCount: NbuFlags.flags.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 150,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              padding: const EdgeInsets.all(20),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset(
                                            NbuFlags.flags[index].imageName,
                                            width: 30,
                                            height: 30,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            nbuViewModel.data[index].code,
                                            style: const TextStyle(),
                                          ),
                                        ],
                                      ),
                                      Icon(NbuFlags.flags[index].isCliked
                                          ? Icons.notifications_active
                                          : Icons.notifications_active_outlined),
                                    ],
                                  ),
                                  Text(
                                    (nbuViewModel.data[index].title),
                                    style: TextStyle(),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          const Text(
                                            "Курс ЦБ",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            (nbuViewModel.data[index].cbprice),
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Покупка",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            (nbuViewModel
                                                .data[index].nbubuyprice),
                                            style: TextStyle(),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            "Продажа",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            (nbuViewModel
                                                .data[index].nbucellprice),
                                            style: const TextStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                    ));
          }),
        ]));
  }
}
