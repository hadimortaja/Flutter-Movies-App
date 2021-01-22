// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';

// import 'detailspage.dart';

// class SeeAllMovies extends StatefulWidget {
//   final DocumentSnapshot snapshot;
//   SeeAllMovies({this.snapshot});

//   @override
//   _SeeAllMoviesState createState() => _SeeAllMoviesState();
// }

// class _SeeAllMoviesState extends State<SeeAllMovies> {
//   @override
//   Widget build(BuildContext context) {
//     Future getPopularData() async {
//       final firestore = FirebaseFirestore.instance;
//       QuerySnapshot snapshot = await firestore.collection("popular").get();
//       return snapshot.docs;
//     }
//     routeToDetails(DocumentSnapshot info)   {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => DetailsPage(info: info,)));
//     }
//     return Scaffold(
      
//       backgroundColor: Colors.black,
//       body: GridView.builder(
//         itemCount:widget.snapshot.data().length ,
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
//   itemBuilder: (_, index) => Container(
//             height: 160,
//             child: FutureBuilder(
//               future: getPopularData(),
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return Container();
//                 } else {
//                   return Container(
//                     margin: EdgeInsets.only(left: 15),
//                   child: GestureDetector(
//                             onTap: () =>routeToDetails(snapshot.data[index]),
                            
//                             child: Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: SizedBox(
//                                 height: 100,
//                                 child: Image.network(
//                                     snapshot.data[index]['image']),
//                               ),
//                             ),
//                           )
//                   );
//                         }
//               }
//             )
                  
  

                
              
//             ),
//           )

//     );
//   }
// }
