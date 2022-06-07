import 'package:contacts_app_kec/Shared/Design.dart';
import 'package:flutter/material.dart';
import 'User.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class UserTile extends StatefulWidget {

  final UserData userData ;
  const UserTile({ required this.userData});

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      fill: Fill.fillBack, // Fill the back side of the card to make in the same size as the front.
      direction: FlipDirection.HORIZONTAL, // default
      front: Front(userData: widget.userData),
      back: Back(userData: widget.userData)
    );
  }
}

class Front extends StatefulWidget {

  final UserData userData ;
  const Front({ required this.userData});

  @override
  State<Front> createState() => _FrontState();
}

class _FrontState extends State<Front> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Card(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: kPrimaryColor,
          backgroundImage: NetworkImage(widget.userData.imgurl),
        ),
        title: Text(widget.userData.username),
        subtitle:Text('${widget.userData.dept} ${widget.userData.designation}'),
      ),
    ),
  );

  }
}

class Back extends StatefulWidget {

  final UserData userData ;
  const Back({ required this.userData});

  @override
  State<Back> createState() => _BackState();
}

class _BackState extends State<Back> {
  @override
  Widget build(BuildContext context) {
    final Uri params = Uri(
      scheme: 'mailto',
      path: widget.userData.email,
    );

    return  Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Card(
        margin: const EdgeInsets.all(10),
        child: ListTile(
          leading:IconButton(
              onPressed: () async {
                await FlutterPhoneDirectCaller.callNumber(widget.userData.phonenumber);
              },
              icon: const Icon(
                  Icons.call,
                color: kPrimaryColor,
              )
          ),
          trailing:IconButton(
            icon: const Icon(
                Icons.email,
              color: kPrimaryColor,
            ),
            onPressed: () async {
                if(await canLaunchUrl(params)){
                  await launchUrl(params);
                }else {
                  throw 'NO EMAIL SENT $params';
                }
            },
      ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35,
                child: TextButton(onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.userData.phonenumber));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Phone Number is Copied'),duration: Duration(seconds: 1),dismissDirection: DismissDirection.horizontal));
                },
                child: Text(
                  widget.userData.phonenumber,
                  style: const TextStyle(
                    color: kPrimaryColor,
                  ),
                )),
              ) ,
              SizedBox(
                height: 35,
                child: TextButton(onPressed: () {
                  Clipboard.setData(ClipboardData(text: widget.userData.email));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Email is Copied'),duration: Duration(seconds: 1),dismissDirection: DismissDirection.horizontal));
                },

                    child: Text(
                      widget.userData.email,
                      style: const TextStyle(
                        color: kPrimaryColor,
                      ),
                    )),
              ) ,

            ],
          ),
        ),
      ),
    );
  }
}


