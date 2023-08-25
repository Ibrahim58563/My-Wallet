import 'package:flutter/material.dart';
import 'package:my_wallet/presentation/pages/custom_app_bar_takes_operation.dart';
import 'package:my_wallet/presentation/pages/default_text_form_field.dart';

class TakeOperationViewBody extends StatelessWidget {
  TakeOperationViewBody({super.key});

  var amount = TextEditingController();
  var details = TextEditingController();
  var date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBarTakesOperation(),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTextFormField(
            contentPaddingVertical: 20,
            textInputType: TextInputType.number,
            controller: amount,
            hintText: "0.00ج.م",
            style: const TextStyle(fontFamily: "Cairo"),

          ),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTextFormField(
            contentPaddingVertical: 20,
            textInputType: TextInputType.text,
            controller: details,
            hintText: "تفاصيل المعاملة",
            style: const TextStyle(fontFamily: "Cairo"),
          ),
        ),
        const SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("تاريخ المعاملة",style: TextStyle(
            fontFamily: "Cairo",
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),),
        ),
        const SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: DefaultTextFormField(
            contentPaddingVertical: 20,
            textInputType: TextInputType.datetime,
            prefixIcon: const Icon(Icons.calendar_month_outlined),
            controller: date,
            hintText: "${DateTime.now()}",
            style: const TextStyle(fontFamily: "Cairo"),
          ),
        ),
        const SizedBox(height: 10,),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text("أضف فاتورة",style: TextStyle(
              fontFamily: "Cairo",
              fontSize: 18,
              fontWeight: FontWeight.bold
          ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: IconButton(onPressed: (){}, icon: Image.asset("assets/images/add-photo.png",color: const Color(0xff2b3396),)),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MaterialButton(
                  elevation: 0,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  color: const Color(0xffe0e0e0),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      "حفظ",
                      style: TextStyle(color: Colors.white,fontFamily: "Cairo",fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
