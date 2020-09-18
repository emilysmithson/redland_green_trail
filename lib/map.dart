import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'custom_icon.dart';
import 'package:proj4dart/proj4dart.dart' as proj4;
import 'tree_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tree_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
//import 'package:user_location/user_location.dart';

class MapPage extends StatefulWidget {
  Function showTreeInformation;
  int currentTreeNumber;
  MapPage(this.showTreeInformation, this.currentTreeNumber);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
//  MapController mapController = MapController();
//  UserLocationOptions userLocationOptions;
//  List<Marker> markers1 = [];
  int currentTree;
  _getTree() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentTree = prefs.getInt('treeNumber' ?? 0);
    _addInformation(currentTree);
  }

  String initText = 'coordinates: ';
  bool treeInfoOpen = false;
  proj4.Point point = proj4.Point(x: 65.05166470332148, y: -19.171744826394896);

  List markers = List<Marker>();

  @override
  void initState() {
    _getTree();
    for (int i = 0; i < trees.length; i++) {
      _addMarker(
        i,
      );
    }

    super.initState();
  }

  void _addInformation(int number) async {
    markers.add(
      Marker(
        width: 100,
        height: 370,
        point: trees[number].coordinates,
        builder: (ctx) => Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                widget.showTreeInformation(number);
              },
              child: Container(
                height: 170,
                width: 100,
                child: Card(
                  elevation: 12.0,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 100,
                          child: Image.asset(trees[number].leafImage,
                              fit: BoxFit.fitHeight)),
                      Container(
                        height: 30,
                        child: Center(
                          child: Text(
                            trees[number].name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Container(
                width: 40,
                height: 80,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 45.0),
                  child: Stack(
                    children: <Widget>[
                      Icon(CustomIcon.tree, color: Colors.green, size: 40),
                      Center(
                          child: Text(
                        trees[number].id.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    treeInfoOpen = true;
  }

  void _addMarker(int number) {
    markers.add(
      Marker(
        width: 40.0,
        height: 80.0,
        point: trees[number].coordinates,
        builder: (ctx) => Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
          child: GestureDetector(
            onTap: () {
              setState(() {
                treeInfoOpen ? markers.removeLast() : null;
                _addInformation(number);
              });
            },
            child: Stack(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 80,
                  child: Stack(
                    children: <Widget>[
                      Icon(CustomIcon.tree,
                          color: widget.currentTreeNumber > number
                              ? Colors.grey
                              : Colors.green,
                          size: 40),
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Text(
                          trees[number].id.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var points = <LatLng>[
    LatLng(51.47177, -2.60810),
    //tree 1
    LatLng(51.471659, -2.607617),
    //tree 2
    LatLng(51.471534, -2.606912),
    LatLng(51.47165, -2.60675),
    LatLng(51.4718, -2.60675),
    //tree 3
    LatLng(51.471877, -2.606633),
    LatLng(51.4719, -2.60677),
    LatLng(51.47210, -2.60684),
    LatLng(51.47227, -2.60688),
    // tree 4
    LatLng(51.472521, -2.606838),
    LatLng(51.47250, -2.60675),
    LatLng(51.47260, -2.60659),
    LatLng(51.47273, -2.60658),
    // tree 5
    LatLng(51.47273, -2.606487),
    LatLng(51.47273, -2.60658),
    LatLng(51.47290, -2.60659),
    LatLng(51.47311, -2.60667),
    LatLng(51.47359, -2.60637),
    LatLng(51.47366, -2.60626),
    LatLng(51.47360, -2.60616),
    // tree 6
    LatLng(51.473624, -2.606125),
    LatLng(51.47368, -2.60628),
    LatLng(51.47377, -2.60645),
    LatLng(51.47385, -2.60634),
    // tree 7
    LatLng(51.473878, -2.60635),
    LatLng(51.47388, -2.60629),
    LatLng(51.47401, -2.60611),
    // tree 8
    LatLng(51.474003, -2.605966),
    LatLng(51.47403, -2.60609),
    LatLng(51.47377, -2.60646),
    LatLng(51.47383, -2.60653),
    LatLng(51.47393, -2.60658),
    LatLng(51.47412, -2.60661),
    LatLng(51.47414, -2.60662),
    LatLng(51.47420, -2.60665),
    LatLng(51.47431, -2.60677),
    LatLng(51.47435, -2.60687),
    LatLng(51.47438, -2.60705),
    LatLng(51.47448, -2.60730),
    LatLng(51.47482, -2.60786),
    LatLng(51.47514, -2.60788),

//tree 9
    LatLng(51.475113, -2.608192),

    LatLng(51.47499, -2.60814),

    LatLng(51.47487, -2.60841),

    //tree 10
    LatLng(51.474971, -2.608379),
    LatLng(51.47487, -2.60841),
//tree 11
    LatLng(51.475323, -2.609523),
    LatLng(51.47528, -2.60949),
    LatLng(51.47519, -2.60958),

    LatLng(51.47511, -2.60979),
    LatLng(51.47506, -2.60988),
    LatLng(51.47499, -2.60994),
    //tree 13
    LatLng(51.474945, -2.609868),
    LatLng(51.47498, -2.60976),
// tree 12
    LatLng(51.474644, -2.608693),
// tree 13
    LatLng(51.474372, -2.607798),
// tree 14
    LatLng(51.474494, -2.607697),
// tree 15
    LatLng(51.474242, -2.607301),

    LatLng(51.474272,	-2.606862),
// tree 16
    LatLng(51.473671, -2.606935),


// tree 17
    LatLng(51.473257, -2.60659),
    LatLng(51.47317, -2.60668),
    LatLng(51.47309, -2.60667),
    LatLng(51.47230, -2.60738),
// tree 18
    LatLng(51.472013, -2.60788),
    LatLng(51.47177, -2.60810),
  ];
  @override
  Widget build(BuildContext context) {
//    userLocationOptions = UserLocationOptions(
//      context: context,
//      mapController: mapController,
//      markers: markers1,
//      zoomToCurrentLocationOnLoad: false,
//      updateMapLocationOnPositionChange: false,
//      showMoveToCurrentLocationFloatingActionButton: true,
//    );

//    print(
//      'LatLng(${point.x.toStringAsFixed(5)}, ${point.y.toStringAsFixed(5)})',
//    );
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: IconButton(
          color: Colors.black,
          icon: Icon(Icons.print),
          onPressed: () async {
            final doc = pw.Document();

            const imageProvider = const AssetImage('assets/images/map.png');
            final PdfImage image = await pdfImageFromImageProvider(
                pdf: doc.document, image: imageProvider);

            doc.addPage(pw.Page(build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(image),
              );
            }));
            await Printing.layoutPdf(
                onLayout: (PdfPageFormat format) async => doc.save());
          },
        ),
      ),
      body: FlutterMap(
        options: MapOptions(
//          plugins: [
//            UserLocationPlugin(),
//          ],
          center: LatLng(51.4735, -2.607506),
          zoom: 16.65,
          maxZoom: 19,
          onTap: (p) => setState(() {
            initText = 'You clicked at';

            point = proj4.Point(x: p.latitude, y: p.longitude);
            if (treeInfoOpen) {
              markers.removeLast();
              treeInfoOpen = false;
            }
          }),

        ),
       // mapController: mapController,
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
            tileProvider: NonCachingNetworkTileProvider(),
          ),
//          MarkerLayerOptions(markers: markers1),
//          userLocationOptions,
          PolylineLayerOptions(
            polylines: [
              Polyline(
                  points: points,
                  strokeWidth: 4.0,
                  isDotted: true,
                  color: Colors.purple),
            ],
          ),
          MarkerLayerOptions(markers: markers),
        ],
      ),
    );
  }
}
