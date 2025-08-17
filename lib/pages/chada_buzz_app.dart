import 'package:chada_buzz/widgets/custom_app_barr.dart';
import 'package:chada_buzz/widgets/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

const mintWhite = Color(0xfff2f2f2);
const primaryColor = Color(0xff009563);

class ChadaBuzzApp extends StatefulWidget {
  const ChadaBuzzApp({super.key});

  @override
  State<ChadaBuzzApp> createState() => _ChadaBuzzAppState();
}

class _ChadaBuzzAppState extends State<ChadaBuzzApp> {
  double totalBill = 0;
  double splittedBill = 0.0;
  final TextEditingController _totalBillController = TextEditingController();
  final TextEditingController _totalPeopleController = TextEditingController();

  void calculateSplittedBill() {
    if (_totalBillController.text.trim().isEmpty &&
        _totalPeopleController.text.trim().isEmpty) {
      showCustomSnackBar("Oops! Looks like you forgot to provide both.");
    }
    if (_totalBillController.text.trim().isEmpty) {
      showCustomSnackBar("Oops! Looks like you forgot to provide total bill");
    } else if (_totalPeopleController.text.trim().isEmpty) {
      showCustomSnackBar("Oops! Looks like you forgot to provide total people");
    }

    double totalBill = double.parse(_totalBillController.text);
    double totalPeople = double.parse(_totalPeopleController.text);
    splittedBill = totalBill / totalPeople;

    setState(() {});
  }

  void showCustomSnackBar(final String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color(0xff009563),
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.sizeOf(context).height;
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: customAppBar(deviceWidth),
      body: Container(
        decoration: BoxDecoration(
          color: mintWhite,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60),
            bottomRight: Radius.circular(60),
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: deviceHeight * 0.25,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                  bottomRight: Radius.circular(60),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                          "Split bill",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontFamily: 'sf',
                          ),
                        )
                        .animate()
                        .slideX(duration: 200.ms, delay: 200.ms)
                        .animate()
                        .fadeIn(duration: 400.ms, delay: 400.ms),

                    Text(
                          "Bill Per Person",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'sf',
                          ),
                        )
                        .animate()
                        .slideY(duration: 200.ms, delay: 200.ms)
                        .animate()
                        .fadeIn(duration: 200.ms, delay: 400.ms),
                    SizedBox(height: 5),
                    Animate(
                      key: ValueKey(splittedBill),
                      child:
                          Text(
                                '\$${splittedBill.toStringAsFixed(2)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'sf',
                                ),
                              )
                              .animate()
                              .scaleXY(duration: 500.ms, delay: 500.ms)
                              .animate()
                              .fadeIn(duration: 100.ms, delay: 100.ms),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            customTextField(
              _totalBillController,
              "Total Bill",
              Icons.monetization_on_sharp,
            ).animate().fadeIn(duration: 500.ms, delay: 500.ms),
            SizedBox(height: 20),
            customTextField(
              _totalPeopleController,
              "Total People",
              Icons.people,
            ).animate().fadeIn(duration: 500.ms, delay: 500.ms),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: primaryColor,
              ),
              child: CupertinoButton(
                onPressed: calculateSplittedBill,
                child: Text(
                  "Split Bill",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sf',
                    letterSpacing: 2,
                  ),
                ),
              ),
            ).animate().flipV(duration: 500.ms, delay: 500.ms),
            SizedBox(height: deviceHeight * 0.1),
            Container(
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
              ),
              child: SizedBox(height: deviceHeight * 0.50),
            ).animate().flipV(duration: 500.ms, delay: 500.ms),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _totalBillController.dispose();
    _totalPeopleController.dispose();
    super.dispose();
  }
}
