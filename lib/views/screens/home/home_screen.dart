import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_app/utils/my_colors.dart';
import 'package:taxi_app/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({Key? key}) : super(key: key);


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  String mapTheme='';
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(23.866955017679153, 90.40288785279594),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
    DefaultAssetBundle.of(context).loadString("assets/map_style/map_style.json").then((value){
      mapTheme=value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            mapType: MapType.normal,
            initialCameraPosition:_kGooglePlex,
            onMapCreated: (GoogleMapController controller){
              controller.setMapStyle(mapTheme);
              _controller.complete(controller);
            },
          ),

          buildProfileTileWidget(),

          buildTextField(),

          buildCurrentLocationIcon(),
          buildNotification(),
          buildBottomSheet(),
        ],
      ),
    );
  }

  Widget buildProfileTileWidget(){
    return Positioned(
      top: 50,
        left: 20,
        right: 20,
        child: Container(
          width: Get.width,
          child:  Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: MyColors.primaryColor,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/images/profile.jpeg'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              const SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Good Evening, ",
                            style: TextStyle(color: MyColors.blackColor,fontSize: 14),
                          ),

                          TextSpan(
                            text: "Riyazur Rohman Kawchar",
                            style: TextStyle(color: MyColors.primaryColor,fontSize: 14,fontWeight: FontWeight.bold),
                          ),
                        ]
                      )
                  ),
                  const customText(text: "Where do you want to go?",fontSize: 18,fontWeight: FontWeight.w700,),
                ],
              )
            ],
          ),
        )
    );
  }

  Widget buildTextField(){
    return  Positioned(
      top: 160,
      left: 20,
      right: 20,
      child: Container(
        alignment: Alignment.center,
        width: Get.width,
        height: 50,
        padding: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: MyColors.blackColor.withOpacity(0.05),
                  blurRadius: 10,
                  spreadRadius: 4
              )
            ],
            borderRadius: BorderRadius.circular(8)
        ),
        child: TextFormField(
          style: GoogleFonts.poppins(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.w400),
          decoration: InputDecoration(
            hintText: "Search you destination",
            hintStyle: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold),
            border: InputBorder.none,
            suffixIcon: const Icon(Icons.search,color: MyColors.primaryColor,size: 30,),

          ),
        ),
      ),
    );
  }


 Widget buildCurrentLocationIcon(){
    return const Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30,right: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: MyColors.primaryColor,
          child: Icon(Icons.my_location,color: MyColors.whiteColor,),
        ),
      ),
    );
  }

 Widget buildNotification(){
    return const Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(bottom: 30,left: 10),
        child: CircleAvatar(
          radius: 20,
          backgroundColor: MyColors.whiteColor,
          child: Icon(Icons.notifications_none_outlined,color: Colors.grey,),
        ),
      ),
    );
  }


 Widget buildBottomSheet(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: Get.width*0.8,
        height: 26,
        decoration: BoxDecoration(
          boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.05),
             blurRadius: 10,
             spreadRadius: 4
           )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          )
        ),
        child: Center(
          child: Container(
            width: Get.width*0.6,
            height: 4,
            color: Colors.black38,
          ),
        ),
      ),
    );
  }
}
