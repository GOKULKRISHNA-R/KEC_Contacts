import 'package:contacts_app_kec/Shared/Design.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Services/User.dart';
import '../../Services/UserCard.dart';

class Userlist extends StatefulWidget {

  final String mystr ;
  final String dept ;

  Userlist( {required this.mystr , required this.dept});

  @override
  State<Userlist> createState() => _UserlistState();
}



class _UserlistState extends State<Userlist> {


  @override
  Widget build(BuildContext context) {

    List <UserData> filteredlist = [] ;

    final users = Provider.of<List<UserData>>(context);

    if(widget.mystr.isNotEmpty && widget.dept != 'ALL DEPT') {

          setState( () {
            filteredlist = users.where((element) => ( element.dept == widget.dept && element.username.toLowerCase().startsWith(widget.mystr.toLowerCase()))).toList();
          });
    }else if (widget.mystr.isNotEmpty && widget.dept == 'ALL DEPT') {
        setState(() {
          filteredlist =
              users.where((element) => (element.username.toLowerCase().contains(widget.mystr.toLowerCase()))).toList();
        });
      }else if(widget.mystr.isEmpty && widget.dept != 'ALL DEPT') {
        setState(() {
          filteredlist = users.where((element) => (element.dept == widget.dept)).toList() ;
        });
      }
      else{
      setState(() {
        filteredlist = users ;
      });
    }


    filteredlist.sort((a, b) {
      return a.username.toLowerCase().compareTo(b.username.toLowerCase());
    });

    return filteredlist.isEmpty ?
            const Center(
                child:
                Text('No Data Available',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                  ),
                )
            ):ListView.builder(
      itemCount: filteredlist.length,
      itemBuilder: (context,index) {
        return UserTile(userData: filteredlist[index]);
      }
    );
  }
}


















/*


    return ListView.builder(

      itemCount: users.length,

      itemBuilder: (context,index){
        return UserTile(userData: users[index]);
      },

return ListView.separated(

itemCount: users.length,

itemBuilder: (context,index){
if (users[index].contains(youSearchString)) {
return UserTile(users[index]);
}
},
separatorBuilder: (BuildContext context, int index)
{
return const Divider();
},

);
*/