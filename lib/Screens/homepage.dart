import 'package:adminpanel/services/get_user_joining_data.dart';
import 'package:adminpanel/widgets/charts/bar_chart.dart';
import 'package:adminpanel/widgets/charts/line_chart.dart';
import 'package:adminpanel/widgets/charts/pie_chart.dart';
import 'package:adminpanel/widgets/glass_morphism.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import '../widgets/reviews.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Sample'),
      ),
      sideBar: sidebarWidget(context, 'home'),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlassMorphism(
                start: 0.6,
                end: 0.7,
                child: Container(
                  height: MediaQuery.of(context).size.width * 0.18,
                  width: MediaQuery.of(context).size.width * 0.18,
                  child: FutureBuilder(
                      future: getUserJoiningData(),
                      builder: (context, AsyncSnapshot snap) {
                        if (!snap.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return BarChart(data: snap.data);
                        }
                      }),
                ),
              ),
              GlassMorphism(start: 0.6, end: 0.7, child: PieChart()),
              GlassMorphism(
                  start: 0.6,
                  end: 0.7,
                  child: LineChart(
                    data: [
                      {'domain': 0, 'measure': 4.1},
                      {'domain': 2, 'measure': 4},
                      {'domain': 3, 'measure': 6},
                      {'domain': 4, 'measure': 1},
                    ],
                  )),
              GlassMorphism(start: 0.6, end: 0.7, child: PieChart2()),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          GlassMorphism(
              start: 0.6,
              end: 0.7,
              child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .15,
                  child: Row(
                    children: [
                      //Daily Sale
                      Container(
                        decoration:
                            BoxDecoration(border: Border(right: BorderSide())),
                        width: MediaQuery.of(context).size.width * 0.1745,
                        child: Column(
                          children: [
                            Icon(
                              Icons.money,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Text(
                                "Daily Sale",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("1200\$",
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                      ),
                      // Weekly Sale
                      Container(
                        decoration:
                            BoxDecoration(border: Border(right: BorderSide())),
                        width: MediaQuery.of(context).size.width * 0.1745,
                        child: Column(
                          children: [
                            Icon(
                              Icons.money,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Text(
                                "Weekly Sale",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("1200\$",
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                      ),
                      //Monthly Sale
                      Container(
                        decoration:
                            BoxDecoration(border: Border(right: BorderSide())),
                        width: MediaQuery.of(context).size.width * 0.1745,
                        child: Column(
                          children: [
                            Icon(
                              Icons.money,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Text(
                                "Monthly Sale",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("1200\$",
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                      ),
                      //Quaterly Sale
                      Container(
                        decoration:
                            BoxDecoration(border: Border(right: BorderSide())),
                        width: MediaQuery.of(context).size.width * 0.1745,
                        child: Column(
                          children: [
                            Icon(
                              Icons.money,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Text(
                                "Quaterly Sale",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("1200\$",
                                style: Theme.of(context).textTheme.bodyMedium)
                          ],
                        ),
                      ),
                      // Yearly Sale
                      Container(
                        decoration:
                            BoxDecoration(border: Border(right: BorderSide())),
                        width: MediaQuery.of(context).size.width * 0.1745,
                        child: Column(
                          children: [
                            Icon(
                              Icons.money,
                              size: 32,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.height *
                                      0.02),
                              child: Text(
                                "Yearly Sale",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ),
                            Text("1200\$",
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                      ),
                    ],
                  ))),
          SizedBox(
            height: 7,
          ),
          GlassMorphism(
            start: 0.6,
            end: 0.7,
            child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: Reviews()),
          )
        ],
      )),
    );
  }
}
