import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contacts_app_kec/Shared/Text_Feild_Container.dart';
import '../../Services/User.dart';
import '../../Services/db.dart';
import '../../Shared/Design.dart';
import '../../Shared/loading/Loading.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({Key? key}) : super(key: key);

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {

  final _formkey = GlobalKey<FormState>();
  final List<String> department = [ 'Select Dept','CSE','ECE','IT','EEE','EIE','CIVIL','MTR','AUTO','MECH','BNYS','MBA','MSC','BSC','CHEM','MATHS','PHY','ENG'];
  bool isFirst = true;
  String _currentName = '' ;
  String _currentPhoneno = '' ;
  String _currentDepartment = '' ;
  String _currentEmail = '' ;
  String _currentDesignation = '';
  String _currentUrl = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final user = Provider.of<UserCls>(context) ;

    return StreamBuilder<UserData>(

        stream: DBService(uid: user.uid).userData,

        builder: (context, snapshot) {

          if(snapshot.hasData){

            UserData? userData = snapshot.data ;
            if(isFirst && userData != null){
              _currentName = userData.username ;
              _currentPhoneno = userData.phonenumber ;
              _currentDepartment = userData.dept;
              _currentEmail = userData.email ;
              _currentDesignation = userData.designation;
              _currentUrl = userData.imgurl;
              isFirst = false;
            }
            return Form(

                key: _formkey,

                child: Column(

                  children: <Widget>[

                    SizedBox(height: size.height * 0.07),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kPrimaryColor,
                      ),
                      padding: const EdgeInsets.fromLTRB(0, 8.5, 0, 0),
                      alignment: Alignment.topCenter ,
                      width: size.width * 0.4,
                      height: size.height * 0.04,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: const Text(
                              'Update Your Profile',
                              style: TextStyle(
                                  color: Colors.white ,
                                )
                          ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),
                    TextFieldContainer(
                      child: TextFormField(
                        initialValue: userData?.username ,
                        decoration: textInputFDecoration.copyWith(
                            hintText: 'Name',
                        ),
                        validator: (val) => val!.isEmpty ? 'Please Enter yr Name' : null ,
                        onChanged: (val) => setState(() => _currentName = val ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    TextFieldContainer(
                      child: TextFormField(
                        initialValue: userData?.designation ,
                        decoration: textInputFDecoration.copyWith(
                            hintText: 'Designation',
                        ),
                        validator: (val) => val!.isEmpty ? 'Please Enter yr Designation' : null ,
                        onChanged: (val) => setState(() => _currentDesignation = val ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    TextFieldContainer(
                      child:DropdownButtonFormField<String>(
                      dropdownColor: kPrimaryLightColor,

                      value: userData?.dept ,
                      onChanged:  (val) => setState(() => _currentDepartment = val! ) ,
                      decoration: textInputFDecoration,
                      items: department.map((e) => DropdownMenuItem<String>(value: e,child: Text(e)) ).toList(),
                    ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    TextFieldContainer(
                      child: TextFormField(
                        initialValue: userData?.phonenumber,
                        decoration: textInputFDecoration.copyWith(hintText: 'Phone Number'),
                        validator: (val) => val!.isEmpty ? 'Please Enter yr Phone No' : null ,
                        onChanged: (val) => setState(() => _currentPhoneno = val ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    TextFieldContainer (
                      child: TextFormField(
                        initialValue: userData?.email,
                        decoration: textInputFDecoration.copyWith(hintText: 'Email'),
                        validator: (val) => val!.isEmpty ? 'Please Enter yr Email' : null ,
                        onChanged: (val) => setState(() => _currentEmail = val ),
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    TextButton.icon(
                        onPressed: () async {
                          if(_formkey.currentState!.validate()) {
                            await DBService(uid: user.uid).updateUserData(_currentName,_currentPhoneno,_currentEmail,_currentDesignation,_currentDepartment,_currentUrl);
                          }
                        } ,
                        icon: const Icon(
                          Icons.update_rounded,
                          color: Colors.black ,
                        ),
                        label: const Text(
                            'Update',
                            style: TextStyle(
                              color: Colors.black ,
                            )
                        )
                    ),
                  ]
                  ,
                )
            );

          } else {
            return const Loading() ;
          }

        }
    );
  }
}
