// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ginee/models/car_ride_model.dart';

class RideDetailCard extends StatelessWidget {
  final CarRide carRide;
  final VoidCallback acceptRide;
  final VoidCallback declineRide;
  const RideDetailCard({
    Key? key,
    required this.carRide,
    required this.acceptRide,
    required this.declineRide,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 2),
                color: Colors.grey.withOpacity(0.5))
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: SizedBox(
                height: size.height * 0.15,
                width: size.width * 0.3,
                child: Image.network(
                  "https://images.unsplash.com/photo-1569433295058-aaa6338e25c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1894&q=80",
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Pick Up: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: carRide.pickUpLocation,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Drop Off: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: carRide.dropOffLocation,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Fare: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: '₹${carRide.fareAmount}',
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Payment Method: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: carRide.paymentMethod,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'Customer Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: carRide.customerName,
                          style: const TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[200],
                              foregroundColor: Colors.green[700],
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: acceptRide,
                          child: const Text("Accept")),
                    ),
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[200],
                              foregroundColor: Colors.red[700],
                              textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              )),
                          onPressed: declineRide,
                          child: const Text("Decline")),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
