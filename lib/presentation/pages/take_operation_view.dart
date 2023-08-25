import 'package:flutter/material.dart';
import 'package:my_wallet/presentation/pages/take_operation_view_body.dart';

class TakeOperationView extends StatelessWidget {
  const TakeOperationView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: TakeOperationViewBody(),
        ),
      ),
    );
  }
}
