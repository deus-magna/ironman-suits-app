import 'package:custom_painter/screens/detail_screen.dart';
import 'package:custom_painter/screens/second_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: '/second',
      routes: <String, WidgetBuilder>{
        '/second': (BuildContext context) => SecondScreen(),
  },
    );
  }
}

class CurvesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFF21232A)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..lineTo(size.width*0.5, 0)
      ..lineTo(size.width*0.5, size.height*0.5)
      ..lineTo(0, size.height*0.5)
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height*0.5)
      ..moveTo(size.width, 0)
      ..lineTo(size.width*0.5, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvesPainter oldDelegate) => true;
}
