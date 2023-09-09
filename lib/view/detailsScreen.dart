import 'package:covid_tracker/compunemts/ReuseableRow.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String country;
  String flag;
  int cases, todayCases, deaths, todayDeaths, recovered, todayRecovered, active;

  DetailsScreen({
    required this.active,
    required this.cases,
    required this.country,
    required this.deaths,
    required this.flag,
    required this.recovered,
    required this.todayCases,
    required this.todayDeaths,
    required this.todayRecovered,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.country),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 7.h,
                  ),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ReuseableRow(
                              title: "Name", value: widget.country.toString()),
                          ReuseableRow(
                              title: "Total Cases",
                              value: widget.cases.toString()),
                          ReuseableRow(
                              title: "Active", value: widget.active.toString()),
                          ReuseableRow(
                              title: "Recovered",
                              value: widget.recovered.toString()),
                          ReuseableRow(
                              title: "Deaths", value: widget.deaths.toString()),
                          ReuseableRow(
                              title: "Today Cases",
                              value: widget.todayCases.toString()),
                          ReuseableRow(
                              title: "Today Recovered",
                              value: widget.todayRecovered.toString()),
                          ReuseableRow(
                              title: "Today Deaths",
                              value: widget.todayDeaths.toString()),
                        ],
                      ),
                    ),
                  ),
                ),
                CircleAvatar(
                  maxRadius: 15.w,
                  backgroundImage: NetworkImage(widget.flag),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
