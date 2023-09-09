import 'package:covid_tracker/compunemts/ReuseableRow.dart';
import 'package:covid_tracker/view/Countries_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

import '../Utils/fetchTotalCassesApi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final ColorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),
  ];

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            SizedBox(
              height: 6.h,
            ),
            FutureBuilder(
              future: stateServices.fetchWorldApi(),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Expanded(
                    flex: 1,
                    child: SpinKitCircle(
                      color: Colors.white,
                      controller: _controller,
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data.cases.toString()),
                            "Recoverd": double.parse(
                                snapshot.data.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data.deaths.toString()),
                          },
                          animationDuration: const Duration(milliseconds: 3200),
                          chartType: ChartType.ring,
                          chartRadius: 150,
                          ringStrokeWidth: 30,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: Column(
                            children: [
                              ReuseableRow(
                                  title: "Population",
                                  value: snapshot.data.population.toString()),
                              ReuseableRow(
                                  title: "Total Cases",
                                  value: snapshot.data.cases.toString()),
                              ReuseableRow(
                                  title: "Recovered",
                                  value: snapshot.data.recovered.toString()),
                              ReuseableRow(
                                  title: "Active",
                                  value: snapshot.data.active.toString()),
                              ReuseableRow(
                                  title: "Deaths",
                                  value: snapshot.data.deaths.toString()),
                              ReuseableRow(
                                  title: "Critical Stage",
                                  value: snapshot.data.critical.toString()),
                              ReuseableRow(
                                  title: "Today Deaths",
                                  value: snapshot.data.todayDeaths.toString()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CountriesListScreen(),
                    ));
              },
              child: Container(
                height: 6.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade400),
                child: const Center(child: Text("Track Countires")),
              ),
            )
          ],
        ),
      ),
    );
  }
}
