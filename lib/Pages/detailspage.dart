import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/Widgets/video.dart';

import 'firstpage.dart';

class DetailsPage extends StatefulWidget {
  final DocumentSnapshot info;
  DetailsPage({this.info});
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: SizedBox(
                        height: 250,
                        width: 150,
                        child: Image.network(widget.info.data()['image']),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 180),
                          child: Text(widget.info.data()['year'],
                              style: TextStyle(color: Colors.white)),
                        ),
                        Container(
                          width: 180,
                          alignment: Alignment.topRight,

                         // color: Colors.red,
                          child: Text(widget.info.data()['name'],
                              style: TextStyle(
                                
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        //Text(widget.info.data()['age'],style: TextStyle(color: Colors.grey.shade500)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 35,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton.icon(
                            onPressed: () {
                              // widget.info.data()['video'];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VideoPlayer(
                                            videoData:
                                                widget.info.data()['video'],
                                          )));
                            },
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.black,
                            ),
                            label: Text(
                              'Play',
                              style: TextStyle(color: Colors.black),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        height: 35,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade500.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: FlatButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.download_outlined,
                              color: Colors.white,
                            ),
                            label: Text(
                              'Download',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: Text(
                            widget.info.data()['Description'],
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                          widget.info.data()['image'],
                        ),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black87, BlendMode.darken))),
              ),
            ),
            expandedHeight: 600,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
