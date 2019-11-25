import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ihc_project/details.dart';
import 'package:ihc_project/MenuHamburger/Hamburger.dart';
import 'package:ihc_project/filter.dart';
import 'package:ihc_project/main.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    super.initState();
  }
  double zoomVal=18.0;

  @override
  Widget build(BuildContext context) {
    var filterButton = Container(
      padding: const EdgeInsets.only(top: 400),
      child: RawMaterialButton(
      onPressed: () {
        Navigator.push(
          context, 
          MaterialPageRoute(builder: (context) => FilterScreen())
        );
      },
      child: new Icon(
        Icons.tune,
        color: Colors.blue,
        size: 35.0,
      ),
      shape: new CircleBorder(),
      elevation: 2.0,
      fillColor: Colors.white,
      padding: const EdgeInsets.all(15.0),
    ));

    return Scaffold(
      appBar: AppBar(
        title: Text("Aplicação IHC"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => DetailScreen())
                // );
              }),
        ],
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          _zoomminusfunction(),
          _zoomplusfunction(),
          filterButton,
        ],
      ),
      drawer: Hamburger(),
    );
  }

 Widget _zoomminusfunction() {
    return Align(
      alignment: Alignment.topLeft,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchMinus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal--;
             _minus( zoomVal);
            }),
    );
 }
 
 Widget _zoomplusfunction() {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
            icon: Icon(FontAwesomeIcons.searchPlus,color:Color(0xff6200ee)),
            onPressed: () {
              zoomVal++;
              _plus(zoomVal);
            }),
    );
 }

 Future<void> _minus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-15.763105, -47.870634), zoom: zoomVal)));
  }

  Future<void> _plus(double zoomVal) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(-15.763105, -47.870634), zoom: zoomVal)));
  }

  Widget _buildGoogleMap(BuildContext context) {

    Marker buildMarker(id, position, name, iconColor, idNum){
      return Marker(
        markerId: MarkerId(id),
        position: position,
        infoWindow: InfoWindow(title: name, 
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailScreen(idNum)),
            );
          } ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            iconColor,
          ),
      );
    }

    var marker1 = buildMarker('unbb1', LatLng(-15.763105, -47.870634), "UnB - Banheiro Exemplo 1", BitmapDescriptor.hueCyan, 0);
    var marker2 = buildMarker('unbb2', LatLng(-15.763505, -47.870234), "UnB - Banheiro Exemplo 2", BitmapDescriptor.hueCyan, 1);
    var marker3 = buildMarker('unbb3', LatLng(-15.763205, -47.870434), "UnB - Banheiro Exemplo 3", BitmapDescriptor.hueCyan, 2);
    var marker4 = buildMarker('unbb4', LatLng(-15.762105, -47.870434), "UnB - Bebedouro Exemplo 1", BitmapDescriptor.hueViolet, 3);
    var marker5 = buildMarker('unbb5', LatLng(-15.762985, -47.870134), "UnB - Bebedouro Exemplo 2", BitmapDescriptor.hueViolet, 4);


    buildMarkers(){
      if(dataInstance.currBathroomFilter && dataInstance.currGoodConditionFilter){
        return {marker2, marker3};
      }
      if(dataInstance.currBathroomFilter){
        return {marker1, marker2, marker3};
      }
      if(dataInstance.currWaterFilter){
        return {marker4, marker5};
      }
      return {marker1,marker2, marker3, marker4, marker5};
    }
    
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:  CameraPosition(target: LatLng(-15.763105, -47.870634), zoom: 18),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },

        markers: buildMarkers(),
      ),
    );
  }
}



// Marker unbMarker = Marker(
//   markerId: MarkerId('unb'),
//   position: LatLng(-15.763105, -47.870634),
//   infoWindow: InfoWindow(title: 'UnB', 
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => TruckScreen(truck: truck)),
//       );
//     } ),
//     icon: BitmapDescriptor.defaultMarkerWithHue(
//       BitmapDescriptor.hueViolet,
//     ),
//   );