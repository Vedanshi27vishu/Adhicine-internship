import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:internship/Utils/Constants/colors.dart';
import 'package:internship/Utils/Constants/sizes.dart';
import 'package:internship/Utils/Helper/helpersfunctions.dart';
import 'package:pie_chart/pie_chart.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Report",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: THelperFunctions.screenHeight() * 0.15,
              width: THelperFunctions.screenWidth() * 0.8,
              child: Card(
                  color: Color.fromARGB(255, 255, 255, 255),
                  elevation: 1.2,
                  shadowColor: const Color.fromARGB(255, 132, 129, 129),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Today's Report",
                          style: TextStyle(
                              fontSize: Sizes.fontSizeLg,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            NumberConatiner(number:"5",text:"Total"),
                                NumberConatiner(number:"3",text:"Taken"),
                                    NumberConatiner(number:"1",text:"Missed"),
                                        NumberConatiner(number:"1",text:"Snoozed"),
                          ],
                        ),
                        

                      ],
                      
                    ),
                  )),
            ),
            SizedBox(height:Sizes.spaceBtwItems),
            Container(
      height: MediaQuery.of(context).size.height * 0.17,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Colors.white,
        elevation: 1.2,
        shadowColor: const Color.fromARGB(255, 132, 129, 129),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Check Dashboard",
                style: TextStyle(
                  fontSize: 18.0, // Replace Sizes.fontSizeLg with a specific size
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Here you will find everything related to your active and past medicines.",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color:Color.fromARGB(255, 154, 152, 152),
                      ),
                      maxLines: 2,
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 70, // Adjust height as needed
                    width: 70, // Adjust width as needed
                    child: CircleAvatar(backgroundImage: AssetImage("assets/Images/WhatsApp Image 2024-06-25 at 13.03.01_5611e420.jpg",),)
                  ),
                ],
              ),
              
            ],
          ),
        ),
    )
    ),
    SizedBox(height: Sizes.spaceBtwSections,),
     Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
         Text(
                    "Check History",
                    style: TextStyle(
                      fontSize: 18.0, // Replace Sizes.fontSizeLg with a specific size
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(Icons.arrow_forward,color: color.primary,),
                  SizedBox(height:Sizes.spaceBtwItems),
                  Container(
      width: 300,
      height: 300,
      child:  PieChart(
        dataMap: <String, double>{
          'January': 5,
          'February': 2,
          'March': 4,
          'April': 3,
          'May': 6,
          'June': 1,
          'July': 7,
          'August': 2,
          'September': 3,
          'October': 5,
          'November': 2,
          'December': 4,
        },
        chartType: ChartType.disc,
        chartRadius: 150,
      ),

                  )
       ],
     ),
    ]
    )
    ),
        );
  
   
  }
}

// ignore: must_be_immutable
class NumberConatiner extends StatelessWidget {
   NumberConatiner({
    super.key,
    required this.number,
    required this.text,
  });
  String number;
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      child: Column(
        children: [
          Text(
            number,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: color.primary),
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 208, 206, 206),fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
