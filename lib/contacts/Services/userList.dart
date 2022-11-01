import 'dart:developer';

import 'package:contacts_app_kec/Shared/design.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user.dart';
import '../../Shared/userCard.dart';

class Userlist extends StatefulWidget {
  final String mystr;
  final String dept;
  final String catogory;

  Userlist(
      {super.key,
      required this.mystr,
      required this.dept,
      required this.catogory});

  @override
  State<Userlist> createState() => _UserlistState();
}

class _UserlistState extends State<Userlist> {
  @override
  Widget build(BuildContext context) {
    List<UDatain> filteredlist = [];
    List<UDatain> finalList = [];

    Size size = MediaQuery.of(context).size;

    // users has data from database
    final users = Provider.of<List<UDatain>>(context);

    filteredlist = users;

    // FILTER ON SEARCH
    if (widget.mystr.isNotEmpty && widget.dept != 'ALL DEPT') {
      setState(() {
        filteredlist = users
            .where((element) =>
                (element.dept.toLowerCase() == widget.dept.toLowerCase() &&
                    element.username
                        .toLowerCase()
                        .contains(widget.mystr.toLowerCase())))
            .toList();
      });
    } else if (widget.mystr.isNotEmpty && widget.dept == 'ALL DEPT') {
      setState(() {
        filteredlist = users
            .where((element) => (element.username
                .toLowerCase()
                .contains(widget.mystr.toLowerCase())))
            .toList();
      });
    } else if (widget.mystr.isEmpty && widget.dept != 'ALL DEPT') {
      setState(() {
        filteredlist = users
            .where((element) =>
                (element.dept.toLowerCase() == widget.dept.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredlist = users;
      });
    }
    setState(() {
      finalList = filteredlist
          .where((element) =>
              element.category.toLowerCase().replaceAll(" ", '') ==
              widget.catogory.toLowerCase().replaceAll(" ", ''))
          .toList();
    });
    // sorting filterd list
    finalList.sort((a, b) {
      return a.index.compareTo(b.index);
    });
    
    return finalList.isEmpty
        ? // if search has no result
        const Center(
            child: Text(
            'No Data Available',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
            ),
          ))
        : // if search has result
        GridView.builder(
            padding: EdgeInsets.symmetric(
                vertical: size.height * 0.03, horizontal: size.width * 0.03),
            itemCount: finalList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: size.height * 0.03,
              crossAxisSpacing: size.width * 0.05,
              childAspectRatio: size.width * 0.5 / size.height * 3.3333,
            ),
            itemBuilder: (context, index) {
              return UserTile(
                udata: finalList[index],
              );
            });
  }
}
