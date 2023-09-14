import 'package:flutter/material.dart';

import 'package:flutter_tutorial/view/StudentAdd.dart';
import 'package:flutter_tutorial/view/studentEdit.dart';

import 'models/Student.dart';

void main(){
  runApp(const MaterialApp(
    home:MyApp()
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

 Student selectedstudent=Student.withid(0,"","",0);
 List<Student> students = [
    Student.withid(1,"meliha", "coskun", 65),
    Student.withid(2,"rumeeysa", "alkaya", 20),
    Student.withid(3,"esra", "gun", 45)
  ];
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BENİM İLK UYGULAMAM"),
      ),
      body: buildBody(context),


    );
  }


  void mesajGoster(BuildContext context, String mesaj) {
    var alert = AlertDialog(
      title: const Text("İşlem Durumu"),
      content: Text(mesaj),
    );
    showDialog(
        context: context, builder: (BuildContext context) => alert);
  }


  Widget buildBody(BuildContext context) {
    return
      Column(
      children: [
        Expanded(child: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: const CircleAvatar(backgroundColor: Colors.green,
                ),
                title: Text(
                    "${students[index].firstname} ${students[index].lastname}"),
                subtitle: Text(
                    "Sınavdan aldığı not:${students[index].grade}  [${students[index].getStatus}]"),
                trailing: buildStatusIcon(students[index].grade),
                onTap: () {
                  setState(() {
                    selectedstudent = students[index] ;
                  });
                  
                });

            })
        ),
        Text("Seçili ögrenci:${selectedstudent.lastname}"),
Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
    
                  
                     child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                     backgroundColor: Colors.orange,
                         ),
                                child: const Row(
                                  children: [
                                    Icon(Icons.add),
                                    SizedBox(width: 1.0),
                                    Text("Yeni Öğrenci"),
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)));
                                }
                            ),
                  
    
                        ),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
    
                    
                       child: ElevatedButton(
                         style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.pink,
                         ),
    
                              child: const Row(
                                  children: [
                                    Icon((Icons.update)),
                                    SizedBox(width: 5.0,),
                                    Text("Güncelle"),
                                  ],
                                ),
                              
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentEdit(selectedstudent)));
                              }
                          ),
                     
                      ),
                     Flexible(
                       fit: FlexFit.tight,
                       flex: 1,
    
                     child:  ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.brown,
                       ),
                            child:
                            const Row(
                              children: [
                                Icon(Icons.delete),
                                SizedBox(width: 5.0,),
                                Text("Sil"),
                              ],
                            ),
                            onPressed: () {
                              setState(() {
                                 students.remove(selectedstudent);
                              });
                        
                              var mesaj = ("Silindi");
                              mesajGoster(context, mesaj);
                         }
                        ),
                     ),
                    ],
                  ),
    




      ],
    );

  }

  Widget buildStatusIcon(int grade) {
    if (grade >= 52) {
      return const Icon(Icons.done);
    } else if (grade >= 45) {
      return const Icon(Icons.access_alarm_sharp);
    } else {
      return const Icon(Icons.clear);
    }
  }

}
