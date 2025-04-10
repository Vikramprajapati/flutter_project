import 'package:flutter/material.dart';
class OfferContainer extends StatelessWidget {
  const OfferContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("     Today's offers"),
                SizedBox(height: 5,),
                Text("Get Special Offer", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text("Up to 20%", style: TextStyle(fontSize: 16, color: Colors.black54)),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Order Now",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF007E6E)),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
