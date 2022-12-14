// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:resortbooking/Model/Property_model.dart';
import 'package:resortbooking/Model/User%20Review%20Room.dart';
import 'package:resortbooking/Model/UserReview_model.dart';
import 'package:resortbooking/Model/user_model.dart';
import 'package:resortbooking/User/Common/Color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resortbooking/User/Common/TextField.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:resortbooking/main.dart';

class reviews extends StatefulWidget {
  final PropertyModel property;

  const reviews({Key? key, required this.property}) : super(key: key);

  @override
  State<reviews> createState() => _reviewsState();
}

class _reviewsState extends State<reviews> {
  @override
  void initState() {
    propertyModel = widget.property;
    super.initState();
  }

  Usermodel targetuser = Usermodel();
  UserReviewRoom? reviewRoom;
  Usermodel usermodel = Usermodel();
  PropertyModel propertyModel = PropertyModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          "Review",
          style: TextStyle(fontFamily: 'NotoSans-Medium', color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                      child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                blurRadius: 25,
                                color: Colors.black12,
                                offset: Offset(5, 5))
                          ]),
                          child: appTextField(
                              textEditingController: message,
                              hintText: "Enter Messgae",
                              maxlines: null))),
                  IconButton(
                      onPressed: () {
                        getReviewModel(targetuser);
                      },
                      icon: FaIcon(FontAwesomeIcons.paperPlane,
                          color: rPrimarycolor, size: 30))
                ],
              ),
              Text("${FirebaseAuth.instance.currentUser!.uid}"),
              Text("${propertyModel.Name}")
            ],
          ),
        ),
      ),
    );
  }

  final message = TextEditingController();

  void SendMessage() async {
    String msg = message.text.trim();
    message.clear();
    if (msg != "") {
      UserReviewModel model = UserReviewModel(
          messageid: uuid.v1(),
          sender: propertyModel.OwnerId,
          timestamp: DateTime.now(),
          text: msg);

      FirebaseFirestore.instance
          .collection('UserReview')
          .doc(reviewRoom!.Roomid)
          .collection("messages")
          .doc(model.messageid)
          .set(model.toMap());
    }
  }

  Future<UserReviewRoom?> getReviewModel(Usermodel targetuser) async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('UserReview')
        .where("Participants.${FirebaseAuth.instance.currentUser!.uid}",
            isEqualTo: true)
        .where("Participants.${propertyModel.OwnerId}", isEqualTo: true)
        .get();

    if (snapshot.docs.length > 0) {
      var docData = snapshot.docs[0].data();
      UserReviewRoom Existingreviewroom =
          UserReviewRoom.fromMap(docData as Map<String, dynamic>);

      reviewRoom = Existingreviewroom;
    } else {
      UserReviewRoom newreviewRoom =
          UserReviewRoom(Roomid: uuid.v1(), Participants: {
        FirebaseAuth.instance.currentUser!.uid.toString(): true,
        propertyModel.OwnerId.toString(): true
      });
      await FirebaseFirestore.instance
          .collection('UserReview')
          .doc(newreviewRoom.Roomid)
          .set(newreviewRoom.toMap());

      reviewRoom = newreviewRoom;
    }
    return reviewRoom;
  }
}
//  Container(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Container(
//                           height: 60,
//                           width: 60,
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Image.asset('assets/image/person.jpg',
//                                 fit: BoxFit.fill),
//                           ),
//                         ),
//                         Container(
//                           margin: EdgeInsets.only(top: 10, left: 10, right: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text("Alexia jane",
//                                   style: TextStyle(
//                                     fontFamily: 'NotoSans-Bold',
//                                   )),
//                               Text("Last Update 21 May, 2022",
//                                   style: TextStyle(
//                                       fontFamily: 'NotoSans-Medium',
//                                       color: rGrey,
//                                       fontSize: 13)),
//                               Text("(8.0)",
//                                   style: TextStyle(
//                                       fontFamily: 'NotoSans-Bold',
//                                       fontSize: 16)),
//                               SizedBox(height: 20),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     Text(
//                       "This is located in a great spot to shops and bars, very quite location",
//                       style: normalStyle,
//                     ),
//                     Row(
//                       children: [
//                         Spacer(),
//                         LikeButton(
//                           likeBuilder: (isLiked) {
//                             return FaIcon(FontAwesomeIcons.thumbsUp,
//                                 color: isLiked ? rPrimarycolor : Colors.black);
//                           },
//                         ),
//                         widthSpace(10),
//                         LikeButton(
//                           likeBuilder: (isLiked) {
//                             return FaIcon(FontAwesomeIcons.thumbsDown,
//                                 color: isLiked ? Colors.red : Colors.black);
//                           },
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),

// Future<UserReviewRoom?> getReviewModel(Usermodel targetuser) async {
//   QuerySnapshot snapshot = await FirebaseFirestore.instance
//       .collection('UserReview')
//       .where("Participants.${usermodel.UserId}", isEqualTo: true)
//       .where("Participants.${targetuser.UserId}", isEqualTo: true)
//       .get();
//
//   if (snapshot.docs.length > 0) {
//     var docData = snapshot.docs[0].data();
//     UserReviewRoom Existingreviewroom =
//     UserReviewRoom.fromMap(docData as Map<String, dynamic>);
//
//     reviewRoom = Existingreviewroom;
//   } else {
//     UserReviewRoom newreviewRoom = UserReviewRoom(
//         Roomid: uuid.v1(),
//         Participants: {
//           usermodel.UserId.toString(): true,
//           targetuser.UserId.toString(): true
//         });
//     await FirebaseFirestore.instance
//         .collection('UserReview')
//         .doc(newreviewRoom.Roomid)
//         .set(newreviewRoom.toMap());
//
//     reviewRoom = newreviewRoom;
//   }
//   return reviewRoom;
// }
