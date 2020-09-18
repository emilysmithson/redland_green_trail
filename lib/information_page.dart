import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:launch_review/launch_review.dart';

class InformationPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  void _launchEmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'emily_foulkes@hotmail.com',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  Widget usefulLinks(String title, String url, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 170,
        child: GestureDetector(
          onTap: () {
            _launchInBrowser(url);
          },
          child: Card(
            color: Color(0xFFA5D6a7),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.launch),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(description)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Redland Green Tree Trail'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Information',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '\nI wrote this app using Flutter to share my love of the trees of Redland Green. \n\n'
              'I am not a professional photographer or  botanist or programmer (yet). I am an enthusiast. \n\n'
              'All of the photos are my own, taken on my phone during Covid 19 lockdown during my one daily exercise. I hope to add more as the seasons change.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 18),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'If you have any comments or queries (bonus points if you spot a mistake) please get in touch via email here.',style: TextStyle(fontSize: 18),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.email),
                    onPressed: () {
                      _launchEmail();
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    'If you have enjoyed this app I would really appreciate a positive review. Please click here.',style: TextStyle(fontSize: 18),
                  ),
                ),
                Center(
                  child: IconButton(
                    icon: Icon(Icons.star),
                    onPressed: () {
                      LaunchReview.launch(
                        androidAppId:
                            "com.flutterdevelopper.redland_green_trail",
                        iOSAppId: "1511416301",
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Row(
              children: <Widget>[
                Expanded(
                    child: Text(
                  'If you would like a paper copy of this map please click here.',style: TextStyle(fontSize: 18),
                  softWrap: true,
                )),
                IconButton(
                  icon: Icon(Icons.print),
                  onPressed: () async {
                    final doc = pw.Document();
                    const imageProvider =
                        const AssetImage('assets/images/map.png');
                    final PdfImage image = await pdfImageFromImageProvider(
                        pdf: doc.document, image: imageProvider);

                    doc.addPage(pw.Page(
                        pageFormat: PdfPageFormat.a4,
                        build: (pw.Context context) {
                          return pw.Center(
                            child: pw.Image(image),
                          ); // Center
                        })); // Page
                    await Printing.layoutPdf(
                        onLayout: (PdfPageFormat format) async => doc.save());
                  },
                ),
              ],
            ),
            Text(
              '\n\nUseful links',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            usefulLinks(
                'Flutter Developer',
                'https://bristolflutterdeveloper.wordpress.com',
                'If you are interested in producing a similar app at a very reasonable price see this website for more information.'),
            usefulLinks(
                'Redland Green Community Group',
                'https://sites.google.com/site/redlandgreencommunity/',
                'If you\'d like to find out more about what is happening on Redland Green or would like to get involved take a look at our website.'),
            usefulLinks(
                'Trees of Bristol',
                'https://bristoltrees.space/Tree/sitecode/REDLGRPA/tree',
                'This site provides an interactive guide to the trees in Bristol and surrounds.'),
            usefulLinks(
              'Pinpoint',
              'https://maps.bristol.gov.uk/pinpoint/',
              'A Bristol City Council site which lets you examine all the local amenities in detail including every tree under Bristol City Council\'s care',
            ),
            usefulLinks('Woodland Trust', 'https://www.woodlandtrust.org.uk',
                'The woodland trust website has tons of information about all tree species and a great app for helping to identify trees.'),
          ],
        ),
      ),
    );
  }
}
