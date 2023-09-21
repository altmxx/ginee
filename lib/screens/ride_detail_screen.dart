// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ginee/models/car_ride_model.dart';

class RideDetailScreen extends StatelessWidget {
  final CarRide carRide;
  const RideDetailScreen({
    Key? key,
    required this.carRide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ride Details"),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.purple[100],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Car Ride Details",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    height: size.height * 0.25,
                    width: size.width * 0.35,
                    child: Image.network(
                      "https://images.unsplash.com/photo-1569433295058-aaa6338e25c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1894&q=80",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Customer Name: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                    TextSpan(
                        text: carRide.customerName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Pick up at: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                    TextSpan(
                        text: carRide.pickUpLocation,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Drop off at: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                    TextSpan(
                        text: carRide.dropOffLocation,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Fare is: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                    TextSpan(
                        text: "₹${carRide.fareAmount}",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Customer will pay via: ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 18)),
                    TextSpan(
                        text: carRide.paymentMethod,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                  onPressed: () {},
                  child: const Row(
                    children: [
                      Icon(Icons.map_outlined),
                      Text("Open Location in Google Maps")
                    ],
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
