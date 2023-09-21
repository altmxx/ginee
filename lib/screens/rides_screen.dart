import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:ginee/models/car_ride_model.dart';
import 'package:ginee/screens/ride_detail_screen.dart';
import 'package:ginee/widgets/ride_detail_card.dart';

class RidesScreen extends StatefulWidget {
  const RidesScreen({super.key});

  @override
  State<RidesScreen> createState() => _RidesScreenState();
}

class _RidesScreenState extends State<RidesScreen> {
  final FlutterTts flutterTts = FlutterTts();
  late Map<String, dynamic> ridesData;
  List<CarRide> carRides = [];
  List<CarRide> acceptedRides = [];
  int i = 0;

  speak(String text) async {
    //sets the language of TTS
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1
    // flutterTts.errorHandler!("The Text To Speech function incurred an error");
    await flutterTts.speak(text); // Recites the text
  }

  Future<Map<String, dynamic>> readJson() async {
    //Loading data from the sample json
    final String response =
        await rootBundle.loadString("assets/jsonData/car_rides_data.json");
    final Map<String, dynamic> data = await jsonDecode(response);
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson().then((value) => ridesData = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (i != 10) {
            carRides.add(CarRide.fromMap(ridesData['results'][i]));
            setState(() {
              i += 1;
            });
          }
          print(carRides);
        },
        child: const Icon(
          Icons.search,
        ),
      ),
      appBar: AppBar(
        title: const Text("Ride Requests"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.purple[100],
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: ListView.separated(
            itemBuilder: (ctx, i) {
              if (carRides.length == 0) {
                speak("Hello! There are no new ride requests yet");
              } else if (i > 0) {
                speak(
                    "Hello! You have multiple ride requests. A new request has been added in your list. Pick up is at ${carRides[i].pickUpLocation}. Drop off is at ${carRides[i].dropOffLocation}. Fare Amount is ${carRides[i].fareAmount} rupees. The customer will be paying via ${carRides[i].paymentMethod}. The name of the customer is ${carRides[i].customerName}");
              } else {
                speak(
                    "Hello! You have a new ride Request. Pick up is at ${carRides[i].pickUpLocation}. Drop off is at ${carRides[i].dropOffLocation}. Fare Amount is ${carRides[i].fareAmount} rupees. The customer will be paying via ${carRides[i].paymentMethod}. The name of the customer is ${carRides[i].customerName}");
              }

              return RideDetailCard(
                carRide: carRides[i],
                acceptRide: () {
                  acceptedRides.add(carRides[i]);
                  carRides.removeAt(i);
                  setState(() {});
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RideDetailScreen(
                            carRide: acceptedRides[i],
                          )));
                },
                declineRide: () {},
              );
            },
            itemCount: carRides.length,
            separatorBuilder: (ctx, i) => const SizedBox(height: 10),
          )),
    );
  }
}
