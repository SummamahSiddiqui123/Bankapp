import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bankapp/components/text_component.dart';
import 'package:bankapp/controllers/home_controller.dart';
import 'package:bankapp/utils/color_constraints.dart';
import 'package:bankapp/view/add_view.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    print("Calling Build Method");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Bank App'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50), 
              GetBuilder<HomeController>(builder: (cahomeControlca) {
                return Center(
                    child: TextComponent(
                        textComponentValue: "${cahomeControlca.counterValue}"));
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: homeControl.amountValue,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  homeControl.addAmount();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                ),
                child: Text("Credit"),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  homeControl.subAmount();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 25),
                ),
                child: Text("Debit"),
              ),
              GetBuilder<HomeController>(builder: (contexta) {
                return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: homeControl.historyData.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:
                            Text("${homeControl.historyData[index]["amount"]}"),
                        trailing:
                            homeControl.historyData[index]["type"] == "Debit"
                                ? Icon(
                                    Icons.arrow_downward_outlined,
                                    color: ColorContraint.debitColor,
                                  )
                                : Icon(
                                    Icons.arrow_upward_outlined,
                                    color: ColorContraint.creditColor,
                                  ),
                      );
                    });
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeControl.addValue();
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.white), 
      ),
    );
  }
}
