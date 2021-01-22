import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/Pages/detailspage.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Future getPopularData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection("popular").get();
      return snapshot.docs;
    }

    Future getPopularData2() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection("popular2").get();
      return snapshot.docs;
    }

    Future getAnimatedData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection("animated").get();
      return snapshot.docs;
    }

    Future getOriginalsData() async {
      final firestore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await firestore.collection("originals").get();
      return snapshot.docs;
    }

    routeToDetails(DocumentSnapshot info) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsPage(
                    info: info,
                  )));
    }

    _buildItem({title, fun}) {
      return Container(
        height: 200,
        child: Column(
          children: [
            Container(
              width: 360,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 159,
              child: FutureBuilder(
                future: fun,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () => routeToDetails(snapshot.data[index]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 210,
                                  child: Image.network(
                                    snapshot.data[index]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
            )
          ],
        ),
      );
    }

    _buildItem2({fun}) {
      return Column(
        children: [
          Container(
            child: Container(
              height: 165,
              child: FutureBuilder(
                future: fun,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  } else {
                    return Container(
                      margin: EdgeInsets.only(right: 15),
                      child: ListView.builder(
                          reverse: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () => routeToDetails(snapshot.data[index]),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 210,
                                  width: 109,
                                  child: Image.network(
                                    snapshot.data[index]['image'],
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          }),
                    );
                  }
                },
              ),
            ),
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            title: Text("أفلامي"),
            centerTitle: true,
            backgroundColor: Colors.black,
            // leading: Image.network(
            //     "https://upload.wikimedia.org/wikipedia/commons/1/1e/RPC-JP_Logo.png"),
          ),
          SliverToBoxAdapter(
            child: Container(
                height: 200,
                child: Carousel(
                  autoplay: true,
                  autoplayDuration: Duration(seconds: 5),
                  animationDuration: Duration(seconds: 1),
                  dotSize: 4,
                  dotSpacing: 15,
                  indicatorBgPadding: 5,
                  dotPosition: DotPosition.bottomRight,
                  dotBgColor: Colors.transparent,
                  images: [
                    Image.network(
                        "https://assets.cairo360.com/app/uploads/2018/02/26198289_902814043229458_102429084789380400_o-875x323.jpg",
                        fit: BoxFit.cover),
                    Image.network(
                        "https://lh3.googleusercontent.com/proxy/S3sDOnQbLpmRjD2uf4JETrtPVHQsazMnJUgSDkKNB1sq8sz0b-b4NJoutBITlPjk9nDlU85uVeOPaUp4zpuiIH10EZUyqMQYKwY_w_s9YwTjQp8_lW35pnYoAl_NFmhTzfEDuRjTuwXkMNH6TtvD-1q2-BQBL7a8YMC0W4eECBw",
                        fit: BoxFit.cover),
                    Image.network(
                        "https://a.cimalight.io/uploads/articles/f7eeb57d.jpg",
                        fit: BoxFit.cover),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: _buildItem(title: "أفلام عربية", fun: getPopularData()),
          ),
          SliverToBoxAdapter(
            child: _buildItem2(fun: getPopularData2()),
          ),
          SliverToBoxAdapter(
              child:
                  _buildItem(title: "أفلام أجنبية", fun: getOriginalsData())),
          SliverToBoxAdapter(
            child: _buildItem(title: "أفلام الأنمي", fun: getAnimatedData()),
          ),
        ],
      ),
    );
  }

  _checkInternetconnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.none) {
      Toast.show("Please Connect to the internet", context,
          textColor: Colors.black,
          duration: Toast.LENGTH_LONG,
          backgroundColor: Colors.white);
    }
  }
}
