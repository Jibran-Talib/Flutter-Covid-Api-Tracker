import 'package:covid_tracker/Utils/fetchTotalCassesApi.dart';
import 'package:covid_tracker/view/detailsScreen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController SearchListControllar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StateServices stateServices = StateServices();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(1.5.h),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: SearchListControllar,
                decoration: InputDecoration(
                    hintText: "Search Countires Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateServices.WorldlistApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                            baseColor: Colors.grey.shade700,
                            highlightColor: Colors.grey.shade100,
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 5.h,
                                    width: 10.w,
                                    color: Colors.white,
                                  ),
                                  title: Container(
                                    height: 2.h,
                                    width: 30.w,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 2.h,
                                    width: 30.w,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ));
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]['country'];
                        if (SearchListControllar.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          country: snapshot.data![index]
                                              ['country'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          cases: snapshot.data![index]['cases'],
                                          deaths: snapshot.data![index]
                                              ['deaths'],
                                          flag: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          recovered: snapshot.data![index]
                                              ['recovered'],
                                          todayCases: snapshot.data![index]
                                              ['todayCases'],
                                          todayDeaths: snapshot.data![index]
                                              ['todayDeaths'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                        ),
                                      ));
                                },
                                child: ListTile(
                                  leading: Image(
                                      height: 8.h,
                                      width: 8.h,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                ),
                              ),
                            ],
                          );
                        } else if (name.toLowerCase().contains(
                            SearchListControllar.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsScreen(
                                          country: snapshot.data![index]
                                              ['country'],
                                          active: snapshot.data![index]
                                              ['active'],
                                          cases: snapshot.data![index]['cases'],
                                          deaths: snapshot.data![index]
                                              ['deaths'],
                                          flag: snapshot.data![index]
                                              ['countryInfo']['flag'],
                                          recovered: snapshot.data![index]
                                              ['recovered'],
                                          todayCases: snapshot.data![index]
                                              ['todayCases'],
                                          todayDeaths: snapshot.data![index]
                                              ['todayDeaths'],
                                          todayRecovered: snapshot.data![index]
                                              ['todayRecovered'],
                                        ),
                                      ));
                                },
                                child: ListTile(
                                  leading: Image(
                                      height: 8.h,
                                      width: 8.h,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                  title: Text(snapshot.data![index]['country']),
                                  subtitle: Text(snapshot.data![index]['cases']
                                      .toString()),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
