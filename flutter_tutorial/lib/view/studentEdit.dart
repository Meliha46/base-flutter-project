// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/controller/validation.dart';


import '../models/Student.dart';



// ignore: must_be_immutable
class StudentEdit extends StatefulWidget{
Student? selectedstudent;
 
  
  StudentEdit(Student? selectStudent, {super.key}){
    selectedstudent!=selectedstudent;
  }
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return _StudentAddState(selectedstudent);
  }
}

class _StudentAddState extends State with StudentValidationMixin {
Student? selectedstudent;

  var formKey=GlobalKey<FormState>();
  _StudentAddState(this.selectedstudent);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      initialValue: selectedstudent?.firstname,
     decoration: const InputDecoration(label: Text("isim ekleyiniz")),
      validator: validateFirstName,
      onSaved: (String? value){
        selectedstudent?.firstname=value!;

      },
    );
  }
  Widget  buildLastnameField() {
    return TextFormField(
      initialValue: selectedstudent?.lastname,
      decoration: const InputDecoration(label: Text("Soyisim ekleyiniz")),
      validator: validateLastName,
      onSaved: (String? value){
        selectedstudent?.lastname=value!;
      },
    );
  }

  Widget  buildGrade() {
    return TextFormField(
      initialValue: selectedstudent?.grade.toString(),
       decoration: const InputDecoration(label: Text("not ekleyiniz")),
      validator: validateGrade,
      onSaved: (String? value){
        selectedstudent?.grade=int.parse(value!);
      },
    );
  }

  Widget buildSubmitButton() {
    return ElevatedButton(
      child: const Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          Navigator.pop(context);
        }
      },

    );

  }
}
