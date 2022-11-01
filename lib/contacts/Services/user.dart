class UserCls {
  final String uid;
  UserCls({required this.uid});
}

class UDatain {
  final int index;
  final String username;
  final String phonenumber;
  final String whatsappnumber;
  final List<dynamic> email;
  final String designation;
  final String dept;
  final String imgurl;
  final String category;
  final String roomNo;

  UDatain(
      {required this.index,
      required this.category,
      required this.whatsappnumber,
      required this.username,
      required this.phonenumber,
      required this.email,
      required this.designation,
      required this.dept,
      required this.roomNo,
      required this.imgurl});
}
