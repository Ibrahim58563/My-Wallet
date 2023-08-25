import 'package:flutter/material.dart';

class DealOutListItem extends StatelessWidget {
  const DealOutListItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          Container(
            // height: height / 4.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xffd9d9d9)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "4 اغسطس 23 9:45 م",
                            style: TextStyle(fontFamily: "Cairo"),
                          )),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "2000",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color(0xffce527a),
                              fontFamily: "Cairo"),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          textAlign: TextAlign.center,
                          "2000",
                          style: TextStyle(
                              color: Color(0xff5c6ab3),
                              fontFamily: "Cairo"),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  const Text(
                    "تنزيل",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Cairo"),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xfffdd8e9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "الرصيد 3786ج.م",
                        style: TextStyle(fontFamily: "Cairo"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
