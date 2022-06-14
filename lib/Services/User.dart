class UserCls{

  final String uid ;

  UserCls({ required this.uid });

}

class UserData {
  final String username ;
  final String phonenumber ;
  final String email ;
  final String designation ;
  final String dept ;
  final String imgurl ;

  UserData({required this.username, required this.phonenumber,required this.email, required this.designation , required this.dept , required this.imgurl});
}

class UserDetails{

  final String username ;
  final String phonenumber ;
  final String email ;

  UserDetails({required this.username , required this.phonenumber , required this.email});

}