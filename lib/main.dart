import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Upload de Arquivos'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File  _file1;
  File  _file2;
  File  _file3;
  File  _file4;
  File  _file5;
  final GlobalKey<ScaffoldState> _scaffoldstate = new GlobalKey<ScaffoldState>();

  Future getFile1()async{
    //FilePickerResult  file = await FilePicker.platform.pickFiles(allowMultiple: true);
    File file = await FilePicker.getFile();

    setState(() {
      _file1 = file;
    });
  }

  Future getFile2()async{
    //FilePickerResult  file = await FilePicker.platform.pickFiles(allowMultiple: true);
    File file = await FilePicker.getFile();

    setState(() {
      _file2 = file;
    });
  }

  Future getFile3()async{
    //FilePickerResult  file = await FilePicker.platform.pickFiles(allowMultiple: true);
    File file = await FilePicker.getFile();

    setState(() {
      _file3 = file;
    });
  }

  Future getFile4()async{
    //FilePickerResult  file = await FilePicker.platform.pickFiles(allowMultiple: true);
    File file = await FilePicker.getFile();

    setState(() {
      _file4 = file;
    });
  }

  Future getFile5()async{
    //FilePickerResult  file = await FilePicker.platform.pickFiles(allowMultiple: true);
    File file = await FilePicker.getFile();

    setState(() {
      _file5 = file;
    });
  }

  void _uploadFile1({filePath1, filePath2, filePath3, filePath4, filePath5}) async {

    String fileName1 = filePath1 != null ? basename(filePath1.path) : "";
    String fileName2 = filePath2 != null ? basename(filePath2.path) : "";
    String fileName3 = filePath3 != null ? basename(filePath3.path) : "";
    String fileName4 = filePath4 != null ? basename(filePath4.path) : "";
    String fileName5 = filePath5 != null ? basename(filePath5.path) : "";

    // print("file base name1:$fileName1");
    // print("file base name2:$fileName2");
    // print("file base name3:$fileName3");
    // print("file base name4:$fileName4");
    // print("file base name5:$fileName5");

    try {
      FormData formData = new FormData.fromMap({
        "cliente": "Aurora Terminais",
        "cnpj": "01777936000196",
        "dta": "123456789",
        "file1": filePath1 != null ? await MultipartFile.fromFile(filePath1.path, filename: fileName1) : "",
        "file2": filePath2 != null ? await MultipartFile.fromFile(filePath2.path, filename: fileName2) : "",
        "file3": filePath3 != null ? await MultipartFile.fromFile(filePath3.path, filename: fileName3) : "",
        "file4": filePath4 != null ? await MultipartFile.fromFile(filePath4.path, filename: fileName4) : "",
        "file5": filePath5 != null ? await MultipartFile.fromFile(filePath5.path, filename: fileName5) : "",
      });

      Response response = await Dio().post("http://10.101.10.22:8080/camera/uploads.php",data: formData);
      //print("File upload response: $response");
      _showSnackBarMsg(response.data['message']);
    } catch (e) {
      //print("expectation Caugch: $e");
    }
  }

  void _showSnackBarMsg(String msg){
    _scaffoldstate.currentState
        .showSnackBar( new SnackBar(content: new Text(msg),));
    setState(() {
      _file1 = null;
      _file2 = null;
      _file3 = null;
      _file4 = null;
      _file5 = null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldstate,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             RaisedButton(
                 color: _file1 == null ? Colors.white60 : Colors.green,
                 textColor: _file1 == null ? Colors.black : Colors.white,
                 padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                 child: Text("EXTRATO DTA"),
                 onPressed: getFile1
             ),
             SizedBox(
               height: 15,
             ),
             RaisedButton(
                 color: _file2 == null ? Colors.white60 : Colors.green,
                 textColor: _file2 == null ? Colors.black : Colors.white,
                 padding: EdgeInsets.only(left: 38, right: 38, top: 20, bottom: 20),
                 child: Text("CONHECIMENTO TRANSPORTE"),
                 onPressed: getFile2
             ),
             SizedBox(
               height: 15,
             ),
             RaisedButton(
                  color: _file3 == null ? Colors.white60 : Colors.green,
                  textColor: _file3 == null ? Colors.black : Colors.white,
                  padding: EdgeInsets.only(left: 120, right: 120, top: 20, bottom: 20),
                  child: Text("INVOICE"),
                  onPressed: getFile3
             ),
             SizedBox(
               height: 15,
             ),
             RaisedButton(
                  color: _file4 == null ? Colors.white60 : Colors.green,
                  textColor: _file4 == null ? Colors.black : Colors.white,
                  padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                  child: Text("PACKING LIST"),
                  onPressed: getFile4
             ),
             SizedBox(
               height: 15,
             ),
             RaisedButton(
                  color: _file5 == null ? Colors.white60 : Colors.green,
                  textColor: _file5 == null ? Colors.black : Colors.white,
                  padding: EdgeInsets.only(left: 65, right: 65, top: 20, bottom: 20),
                  child: Text("OUTROS DOCUMENTOS"),
                  onPressed: getFile5
             ),
             SizedBox(
               height: 40,
             ),
             RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.only(left: 100, right: 100, top: 20, bottom: 20),
                  child: Text("Enviar"),
                  onPressed: (){
                    _uploadFile1(
                      filePath1: _file1,
                      filePath2: _file2,
                      filePath3: _file3,
                      filePath4: _file4,
                      filePath5: _file5,
                    );
                  }
             ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getFile,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


