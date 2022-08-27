import 'dart:ui';

import 'package:adminpanel/services/get_user_joining_data.dart';
import 'package:adminpanel/widgets/charts/bar_chart.dart';
import 'package:adminpanel/widgets/charts/line_chart.dart';
import 'package:adminpanel/widgets/charts/pie_chart.dart';
import 'package:adminpanel/widgets/glass_morphism.dart';
import 'package:adminpanel/widgets/sidemenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

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
          Wrap(
            clipBehavior: Clip.antiAlias,
            runSpacing: 100,
            spacing: 18,
            children: [
              GlassMorphism(
                start: 0.6,
                end: 0.7,
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
              GlassMorphism(
                start: 0.6,
                end: 0.7,
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
              GlassMorphism(
                start: 0.6,
                end: 0.7,
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
              )
            ],
          ),
          GlassMorphism(
            start: 0.6,
            end: 0.7,
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
          )

          // Container(
          //   height: 200,
          //   width: 300,
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
          //     child: Container(
          //       decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
          //     ),
          //   ),
          // )
        ],
      )),
    );
  }
}
