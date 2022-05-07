import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:get_it/get_it.dart';
final adminPage=GetIt.instance;

void setup(){
adminPage.registerLazySingleton<dropDown>(()=>dropDown());

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url = "";
  int? number;

  uploadDatatoFirebase() async {
    number = Random().nextInt(10);
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    String basename = pick.path;
    String fileName = basename.split('/').last;
    var file = pick.readAsBytesSync();
    String name = DateTime.now().microsecondsSinceEpoch.toString();
    var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");
    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();


    await FirebaseFirestore.instance
        .collection("dbname")//over here as a variable where db name is PS line 113
        .doc()
        .set({'fileUrl': url, 'num': fileName.toString()});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Pdf"),
      ),
      body: Container(
          child: GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1), children: [
        Container(
          child: Text("Please Select the course you want"),
        ),

        Center(child: dropDown()),

        Container(
       
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("file").snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, i) {
                      QueryDocumentSnapshot x = snapshot.data!.docs[i];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      View(url: x['fileUrl'])));
                        },
                        child: Container(
                        
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/pdf.png'),
                              
                              fit: BoxFit.contain,
                          ),),
                          margin: EdgeInsets.symmetric(vertical: 30),
                          child: Text(x["num"]),
                        ),
                      );
                    });
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ) // use it
      ])),
      floatingActionButton: FloatingActionButton(
        onPressed: uploadDatatoFirebase,
        child: Icon(Icons.add),
      ),
    );
  }
}

class dropDown extends StatefulWidget {
  const dropDown({Key? key}) : super(key: key);

  @override
  State<dropDown> createState() => _dropDownState();
}

class _dropDownState extends State<dropDown> {
  String dropdownValue = "CCC";//access the value selected from this widget

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) { 
        setState(() {
        
          dropdownValue = newValue!;
         
        });
      },
      items: <String>[
        'CCC',
        'Tally',
        'Adv Excel',
        'DTP',
        'Python',
        'Java',
        'C and C++',
        'Web development',
        'App development',
        'Cyber Security',
        'AutoCAD',
        'Digital Marketing',
        'Robotics',
        'Internet of Things',
        'Artificial intelligence'
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class View extends StatelessWidget {
  PdfViewerController? _pdfViewerController;
  final url;

  View({this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("pdf-viewer"),
      ),
      body: SfPdfViewer.network(
        url,
        controller: _pdfViewerController,
      ),
    );
  }
}
