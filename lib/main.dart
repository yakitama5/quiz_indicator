import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:quiz_indicator/components/quiz_progress_Indicator.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xffFFFFEB),
      ),
      home: const SamplePage(),
    );
  }
}

class SamplePage extends StatefulWidget {
  const SamplePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SampleState();
}

class _SampleState extends State<SamplePage> {
  bool _isInAsyncCall = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _isInAsyncCall,
        opacity: 0.5,
        progressIndicator: QuizProgressIndicator(),
        child: Center(
          child: RaisedButton(
            onPressed: () async {
              setState(() {
                _isInAsyncCall = true;
              });

              await Future.delayed(const Duration(seconds: 5));

              setState(() {
                _isInAsyncCall = false;
                Fluttertoast.showToast(msg: "Success!!!");
              });
            },
            child: Text("Go"),
          ),
        ),
      ),
    );
  }
}
