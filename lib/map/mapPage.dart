import 'package:amap_base/amap_base.dart';
import 'package:flutter/material.dart';
import '../single/themeSingle.dart';

const polylineList = const [
  LatLng(39.999391, 116.135972),
  LatLng(39.898323, 116.057694),
  LatLng(39.900430, 116.265061),
  LatLng(39.955192, 116.140092),
];
class DrawPolylineScreen extends StatefulWidget {
  DrawPolylineScreen();

  factory DrawPolylineScreen.forDesignTime() => DrawPolylineScreen();

  @override
  _DrawPolylineScreenState createState() => _DrawPolylineScreenState();
}

class _DrawPolylineScreenState extends State<DrawPolylineScreen> {
  AMapController _controller;
  MyLocationStyle _myLocationStyle = MyLocationStyle();
  ThemeSingelManager themeSingelManager = new ThemeSingelManager();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('地图'),
        backgroundColor: themeSingelManager.getThemeColor(),
        centerTitle: true,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: new PopupMenuButton(
              
              padding: EdgeInsets.only(top: 64.0),
              child: Image(
                image: AssetImage("images/展开栏@2x.png"),
                height: 25.0,
                width: 25.0,
              ),
              itemBuilder:(BuildContext context){
                return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: ListTile(
                    title: Text('行车围栏'),
                    leading: Image(
                      image: AssetImage('images/展开栏@2x.png'),
                    ),
                  ),
                  value: "hot",
                ),
                PopupMenuItem<String>(child: Text("最新"), value: "new",),
              ];
                
              } ,
            )
          ),
          
        ],
      ),
      body: AMapView(
        onAMapViewCreated: (controller) {
          _controller = controller;
          _updateMyLocationStyle(context,showMyLocation:true);
          // controller.addPolyline(
          //   PolylineOptions(
          //     latLngList: polylineList,
          //     color: Colors.red,
          //     isDottedLine: false,
          //     isGeodesic: true,
          //     dottedLineType: PolylineOptions.DOTTED_LINE_TYPE_CIRCLE,
          //     width: 20,
          //   ),
          // );
        },
         amapOptions: AMapOptions(
          compassEnabled: false,
          zoomControlsEnabled: true,
          logoPosition: LOGO_POSITION_BOTTOM_CENTER,
          camera: CameraPosition(
                  zoom: 15,
                ),
          ),
      ),
    );
  }

  void _updateMyLocationStyle(
    BuildContext context, {
    String myLocationIcon,
    double anchorU,
    double anchorV,
    Color radiusFillColor,
    Color strokeColor,
    double strokeWidth,
    int myLocationType,
    int interval,
    bool showMyLocation,
    bool showsAccuracyRing,
    bool showsHeadingIndicator,
    Color locationDotBgColor,
    Color locationDotFillColor,
    bool enablePulseAnnimation,
    String image,
  }) async {
    if (await Permissions().requestPermission()) {
      _myLocationStyle = _myLocationStyle.copyWith(
        myLocationIcon: myLocationIcon,
        anchorU: anchorU,
        anchorV: anchorV,
        radiusFillColor: radiusFillColor,
        strokeColor: strokeColor,
        strokeWidth: strokeWidth,
        myLocationType: myLocationType,
        interval: interval,
        showMyLocation: showMyLocation,
        showsAccuracyRing: showsAccuracyRing,
        showsHeadingIndicator: showsHeadingIndicator,
        locationDotBgColor: locationDotBgColor,
        locationDotFillColor: locationDotFillColor,
        enablePulseAnnimation: enablePulseAnnimation,
        image: image,
      );
      _controller.setMyLocationStyle(_myLocationStyle);
    } else {

    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
