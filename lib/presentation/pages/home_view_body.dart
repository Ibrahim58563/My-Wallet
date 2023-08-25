import 'package:flutter/material.dart';
import 'package:my_wallet/presentation/pages/custom_app_bar.dart';
import 'package:my_wallet/presentation/pages/deal_out_bar.dart';
import 'package:my_wallet/presentation/pages/deal_out_list_view.dart';
import 'package:my_wallet/presentation/pages/take_operation_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 10,
          ),
          const DealOutBar(),
          const SizedBox(
            height: 10,
          ),
          const DaelOutList(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(

              children: [
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xfffa417a),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "اعطيت",
                        style: TextStyle(color: Colors.white,fontFamily: "Cairo",fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20,),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const TakeOperationView()));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    color: const Color(0xff2b3396),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "حصلت",
                        style: TextStyle(color: Colors.white,fontFamily: "Cairo",fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
