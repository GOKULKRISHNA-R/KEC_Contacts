import 'package:cached_network_image/cached_network_image.dart';
import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/material.dart';
import '../contacts/Services/user.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';

class UserTile extends StatelessWidget {
  final UDatain udata;

  UserTile({Key? key, required this.udata}) : super(key: key);

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    cardKey.currentState?.toggleCard();
    return FlipCard(
        key: cardKey,
        fill: Fill
            .fillBack, // Fill the back side of the card to make in the same size as the front.
        direction: FlipDirection.HORIZONTAL, // default
        front: Front(uData: udata),
        back: Back(uData: udata));
  }
}

class Front extends StatelessWidget {
  final UDatain uData;
  const Front({super.key, required this.uData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String val = uData.dept;
    if (uData.dept == 'Artificial Intelligence') {
      val = "AI";
    } else if (uData.dept == 'Automobile Engineering') {
      val = "AUTO";
    } else if (uData.dept == 'CIVIL ENGINEERING') {
      val = "CIVIL";
    } else if (uData.dept == 'Computer Applications') {
      val = "CA";
    } else if (uData.dept == 'Food Technology') {
      val = "FT";
    } else if (uData.dept == 'Mechanical') {
      val = "MECH";
    } else if (uData.dept == 'Mathematics') {
      val = 'MATHS';
    } else if (uData.dept == 'Chemistry') {
      val = 'Chem';
    } else if (uData.dept == 'English') {
      val = 'ENG';
    }

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: kPrimaryMediumColor, blurRadius: 6, offset: Offset(4, -3))
        ],
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(25)),
            child: CachedNetworkImage(
              imageUrl: uData.imgurl,
              width: double.infinity,
              height: size.height * 0.192,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: const EdgeInsets.all(0),
            height: size.height * 0.03,
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(
                size.width * 0.025, size.height * 0.005, 0, 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Text(
                  uData.username,
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(
              size.width * 0.03,
              size.height * 0.01,
              0,
              size.height * 0.005,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  val.toUpperCase(),
                  style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 12,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(0),
                  padding: const EdgeInsets.all(0),
                  height: size.height * 0.02,
                  width: size.width * 0.3,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Text(
                        uData.designation,
                        style: const TextStyle(
                          color: kPrimaryColor,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Back extends StatelessWidget {
  final UDatain uData;
  const Back({super.key, required this.uData});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: kPrimaryMediumColor, blurRadius: 6, offset: Offset(4, -3))
        ],
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: size.height * 0.05,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        await FlutterPhoneDirectCaller.callNumber(
                            uData.phonenumber.toString());
                      },
                      icon: Icon(
                        Icons.call,
                        color: kPrimaryColor,
                        size: size.height * 0.024,
                      )),
                  TextButton(
                    onLongPress: () {
                      Clipboard.setData(
                          ClipboardData(text: uData.phonenumber.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text('Phone Number is Copied',
                              style: TextStyle(color: kPrimaryLightColor)),
                          duration: Duration(seconds: 1),
                          dismissDirection: DismissDirection.horizontal));
                    },
                    onPressed: () {},
                    child: Text(uData.phonenumber.toString(),
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: size.height * 0.0189)),
                  )
                ],
              )),
          SizedBox(
              height: size.height * 0.04,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () async {
                        var whatsappUrl = Uri.parse(
                            "whatsapp://send?phone= +91${uData.whatsappnumber}");
                        await canLaunchUrl(whatsappUrl)
                            ? launchUrl(whatsappUrl)
                            : ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    backgroundColor: kPrimaryColor,
                                    content: Text(
                                      "There is no whatsapp installed",
                                      style:
                                          TextStyle(color: kPrimaryLightColor),
                                    ),
                                    duration: Duration(seconds: 1),
                                    dismissDirection:
                                        DismissDirection.horizontal));
                      },
                      icon: Icon(
                        Icons.whatsapp,
                        color: Colors.green[700],
                        size: size.height * 0.025,
                      )),
                  TextButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: uData.whatsappnumber.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          backgroundColor: kPrimaryColor,
                          content: Text(
                            'WhatsApp Number is Copied',
                            style: TextStyle(color: kPrimaryLightColor),
                          ),
                          duration: Duration(seconds: 1),
                          dismissDirection: DismissDirection.horizontal));
                    },
                    child: Text(uData.whatsappnumber.toString(),
                        style: TextStyle(
                            color: Colors.green[700],
                            fontSize: size.height * 0.0189)),
                  )
                ],
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: uData.email
                .map((e) => SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () async {
                              final Uri params = Uri(
                                scheme: 'mailto',
                                path: e.toString(),
                              );
                              if (await canLaunchUrl(params)) {
                                await launchUrl(params);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: kPrimaryColor,
                                        content: Text(
                                          "Email couldn't be sent ",
                                          style: TextStyle(
                                              color: kPrimaryLightColor),
                                        ),
                                        duration: Duration(seconds: 1),
                                        dismissDirection:
                                            DismissDirection.horizontal));
                                throw 'NO EMAIL SENT $params';
                              }
                            },
                            icon: Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                              size: size.height * 0.025,
                            )),
                        Expanded(
                          flex: 1,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: TextButton(
                              onPressed: () {
                                Clipboard.setData(
                                    ClipboardData(text: e.toString()));
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        backgroundColor: kPrimaryColor,
                                        content: Text(
                                          'Email is Copied',
                                          style: TextStyle(
                                              color: kPrimaryLightColor),
                                        ),
                                        duration: Duration(seconds: 1),
                                        dismissDirection:
                                            DismissDirection.horizontal));
                              },
                              child: Text(e.toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.height * 0.0189)),
                            ),
                          ),
                        )
                      ],
                    )))
                .toList(),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(
                    right: size.width * 0.05, bottom: size.height * 0.01),
                child: Text(uData.roomNo,
                    style: const TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
