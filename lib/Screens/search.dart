import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          title: TextField(
            decoration: InputDecoration(
                hintText: "Search for a movie",
                hintStyle: TextStyle(color: Colors.white),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic_none,
                    color: Colors.grey,
                  ),
                )),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              Text(
                "Popular Searches",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 400,
                child: null,
              )
            ],
          ),
        ));
  }
}
