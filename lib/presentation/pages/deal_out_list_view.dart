import 'package:flutter/material.dart';

import 'deal_out_list_item.dart';

class DaelOutList extends StatelessWidget {
  const DaelOutList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const DealOutListItem();
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 10,
          );
        },
      ),
    );
  }
}