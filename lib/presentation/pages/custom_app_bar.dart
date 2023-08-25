import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return  Container(
      height: height / 3.5,
      decoration: const BoxDecoration(
        color: Color(0xff2b3396),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 28,
                      )),
                  const CircleAvatar(
                    radius: 23,
                    backgroundColor: Color(0xff2e55ba),
                    child: Text(
                      "اف",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Expanded(
                    child: Text(
                      " احمد فايز عبدالفتاح",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call,
                        color: Colors.white,
                        size: 28,
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 30, horizontal: 60),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "ليا بره",
                      style: TextStyle(
                          color: Color(0xff363b65),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                    ),
                    Text(
                      "345267 ج.م",
                      style: TextStyle(
                          color: Color(0xfffa417a),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontFamily: "Cairo"),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
