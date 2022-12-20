
import 'package:flutter/material.dart';
import 'package:quiz/model/model.dart';

import 'buttons.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
   int index = 0;
   List replies = <bool> [];
   List correctanswers = <bool> [];
   List wronganswers = <bool> [];

  void check (bool value){
    if (quiz[index].answer == value) {
      replies.add(true);
      correctanswers.add(true);
    }
    else {
       replies.add(false);
       wronganswers.add(false);
    }

    setState(() {
      if (quiz[index] == quiz.last) {
        showDialog(
          context: context,
           builder: (context) {
             return AlertDialog(
              insetPadding:const EdgeInsets.all(10),
              title:const Text ('Your results...'),
              content: Row(
                children: [
                  Text (
                    'Correct answers ${correctanswers.length}.',
                    style:const TextStyle(color: Colors.green),
                    ),
                    Expanded(
                  child: Padding(
                    padding:const EdgeInsets.only(left: 1),
                    child: Text ('Incorrect answers ${wronganswers.length}.',
                     style:const TextStyle(color: Colors.red),
                    ),
                  
                  ),
                    ),
                ],
              ), 
            // 'Correct answers ${correctanswers.length}.Incorrect answers ${wronganswers.length}.'          
                actions: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        index = 0;
                        replies.clear();
                        correctanswers.clear();
                        wronganswers.clear();
                        Navigator.pop(context);
                      });
                    }, 
                    child: const Text ('Try again.',style: TextStyle (color: Colors.black),))
                ],
             );
           }
           );
      }
      else {
        index ++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFB39DDB),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD1C4E9),
        centerTitle: true,
        title:const Text(
          'Home work-07',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold
            ),
          ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          const Spacer(),
            Text(
             quiz[index].questions,
             textAlign: TextAlign.center,
             style:const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold
              ),
            ),
           const Spacer(),
           //1
            Buttons(
              btn: true,
              touch: (value) {
                check(value);
              },
            ),
             const SizedBox(
              height: 20,
            ),
            //2
             Buttons(
              btn: false,
              touch: (value) {
                check(value); 
              },
            ),
           const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 40,
              child: ListView.builder(
                itemCount: replies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, i) {
                  return replies [i] 
                  ? const  Result(rsl: true) 
                  : const Result(rsl: false);
                })
               ),
            ),
             const SizedBox(
                  height: 120,
                ),
          ],
        ),
      ),
    );
  }
}



