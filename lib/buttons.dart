import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.btn,
    required this.touch,
  }) : super(key: key);

  final bool btn;
  final void Function(bool) touch ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () => touch (btn),
        style: ElevatedButton.styleFrom(
          backgroundColor: btn ? Colors.green :  Colors.red,
        ),
        child:Text(
          btn ? 'true' : 'false',
          style:const TextStyle(
            fontSize: 25
          ),
          ),
       ),
    );
  }
}

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.rsl
  }) : super(key: key);

    final bool rsl;

  @override
  Widget build(BuildContext context) {
    return Icon(
      rsl ? Icons.check : Icons.close,
      color: 
       rsl ? Colors.green : Colors.red
      );
  }
}