import 'package:flutter/material.dart';

void main() => runApp(MyFirstApp());

class MyFirstApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _MyFirstAppState();
   }
}

class _MyFirstAppState extends State<MyFirstApp> {
  late bool _loading; // идет загрузка или нет
  late double _progressValue; // отображение процесса загрузки

  @override
  void initState() {
   _loading = false;
  _progressValue = 0.0;
   super.initState();
   }

  @override
  Widget build(BuildContext cxt) {
   return MaterialApp(
   home: Scaffold(
   appBar: AppBar(
   title: Text(
   'Learning Stateful Widget',
   ),
   centerTitle: true,
  backgroundColor: Colors.deepOrange,
   ),
  backgroundColor: Colors.white70,
   body: Center(
   child: Container(
   padding: EdgeInsets.all(30),
  child: _loading
 ? Column(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
   LinearProgressIndicator(
  value: _progressValue,
   color: Colors.deepOrange,
  backgroundColor: Colors.black,
  ),
  Text('${(_progressValue * 100).round()}%',
   style: TextStyle(
   fontSize: 30, color: Colors.deepOrange)),
 ],
   )
   : Text('Click button to download',
   style: TextStyle(fontSize: 30, color: Colors.black)),
   ),
   ),
   floatingActionButton: FloatingActionButton(
  onPressed: () {
   setState(() {
   // самый важный метод который нужно использовать с любым statefull widget
   _loading = !_loading;
   _updateProgress();
  });
   },
   backgroundColor: Colors.deepOrange,
   child: Icon(Icons.cloud_circle),
   ),
   ),
   );
   }

   void _updateProgress() {
   const oneSec = const Duration(seconds: 1);
   Timer.periodic(oneSec, (Timer t) {
   setState(() {
   _progressValue += 0.2;

  if (_progressValue.toStringAsFixed(1) == '1.0') {
   _loading = false;
 t.cancel();
   _progressValue = 0.0;
   return;
   }
   });
   });
   }
}