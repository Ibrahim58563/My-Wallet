import 'package:flutter/material.dart';
import 'package:my_wallet/presentation/pages/home_view_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
         body: HomeViewBody(),
        ),
      ),
    );
  }
}
