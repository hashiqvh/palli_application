import 'package:flutter/material.dart';
import 'package:palli_application/core/models/user_model.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/presentation/common/components/custom_card.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Responsive.isMobile(context) ? 15 : 20,
      ),
      child: Column(
        children: [
          GridView.builder(
            itemCount: dummyDataList.length,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
                crossAxisSpacing: !Responsive.isMobile(context) ? 15 : 12,
                mainAxisSpacing: 12.0),
            itemBuilder: (context, i) {
              return CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network(dummyDataList[i].image),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 4),
                      child: Text(
                        dummyDataList[i].name,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(
                      dummyDataList[i].phone,
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
