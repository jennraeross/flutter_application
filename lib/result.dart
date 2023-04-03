import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final VoidCallback reset;
  Result(this.score, this.reset);

  String get resultPhrase {
    String resultText;
    if (score <= 8) {
      resultText = "Maybe you'll do better next time?";
    } else if (score <= 12) {
      resultText = "Decent Work!";
    } else {
      resultText = "You're a Rockstar!";
    }
    resultText += '\n\nTotal Score: ' + score.toString();
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('Go Back'),
              onPressed: reset,
            ),
          )
        ],
      ),
    );
  }
}
