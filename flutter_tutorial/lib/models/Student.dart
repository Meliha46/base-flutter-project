class Student{
 late String firstname;
 late String lastname;
 late int grade;
 late String status;
 late int id;

  Student.withid(int id,String firsname,String lastname,int grade ){
    this.firstname=firsname;
    this.lastname=lastname;
    this.grade=grade;
    this.status="gecti";
    this.id=id;
  }

 Student(String firsname,String lastname,int grade ){
   this.firstname=firsname;
   this.lastname=lastname;
   this.grade=grade;
   this.status="gecti";
 }
 Student.withoutinfo(){

 }
  String get getStatus{
    String message = "";
    if (grade > 60) {
      message = "gecti";
    }
    else if (grade < 40) {
      message = "bütünlemeye kaldı";
    }
    else
      message = "kaldı";
    return message;

  }
}