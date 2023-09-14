// ignore: file_names


import 'package:flutter/material.dart';
import 'package:flutter_tutorial/controller/validation.dart';

import '../models/Student.dart';



// ignore: must_be_immutable
class StudentAdd extends StatefulWidget{
  late List<Student> students;
  StudentAdd( this.students, {super.key});
  @override
  State<StatefulWidget> createState() {
   // ignore: no_logic_in_create_state
   return _StudentAddState(students);
  }
}
class _StudentAddState extends State with StudentValidationMixin {
  late List<Student> students;
  _StudentAddState(this.students);
  var student =Student.withoutinfo();
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return
 
 Scaffold(
   appBar: AppBar(
     title: const Text("Yeni Öğrenci Ekle"),
   ),
   body: Form(
     key: formKey,
     child: Column(
       children: [
         buildFirstnameField(),
         buildLastnameField(),
         buildGrade(),
         buildSubmitButton()
       ],
     ),
   )
 );
  }

Widget  buildFirstnameField() {
    return TextFormField(
    decoration: const InputDecoration(labelText: "Öğrenci adı:",hintText: "Meliha"),
    validator: validateFirstName,
    onSaved: (String? value){
      student.firstname=value!;

    },
  );
}
  Widget  buildLastnameField() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Öğrenci soyadı:",hintText: "Coşkun"),
      validator: validateLastName,
      onSaved: (String? value){
        student.lastname=value!;
        },
    );
  }

  Widget  buildGrade() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Aldığı Not:",hintText: "65"),
      validator: validateGrade,
      onSaved: (String? value){
        student.grade=int.parse(value!);
      },
    );
  }

 Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: (){
     if(formKey.currentState!.validate()){
       formKey.currentState!.save();
       students.add(student);
       Navigator.pop(context);
     }
      },

    );

 }
}