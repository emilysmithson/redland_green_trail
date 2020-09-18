import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(MediaQuery.of(context).orientation==Orientation.portrait?
                  'assets/images/leaves.jpeg': 'assets/images/leaves_landscape.jpeg', fit: BoxFit.fill
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Welcome to the Redland Green Tree Trail.',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                      'We hope this tree trail will help you identify some of the most common species of trees that are found here on our beautiful Village Green. \n ',
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.justify),
                ),
                Image.asset('assets/images/redland_green.jpg',
                    fit: BoxFit.fitWidth),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '\nThis walk is approximately 1200m (0.8miles) with some hills. Some parts of the trail are on the grass. '
                            '\n\nThe walk has audio - just click the blue button to play.'
                            '\n\nIf you have children with you or would just prefer a printed map, you can print from the info page (top right).',

                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        '\n\nClick on the map or list in the tab bar below to begin\n\n',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),

                Container(height: 200),
              ],
            ),
          ],
        )
      ],
    );
  }
}
