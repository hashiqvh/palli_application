import 'package:flutter/material.dart';
import 'package:palli_application/core/models/user_model.dart';
import 'package:palli_application/core/responsive.dart';
import 'package:palli_application/main.dart';
import 'package:palli_application/presentation/common/components/custom_card.dart';
import 'package:palli_application/presentation/home/components/header_widget.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Responsive.isMobile(context) ? 15 : 20,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Responsive.isMobile(context) ? 5 : 18,
            ),
            Header(scaffoldKey: scaffoldKey),
            SizedBox(
              height: Responsive.isMobile(context) ? 5 : 18,
            ),
            GridView.builder(
              primary: false,
              itemCount: dummyDataList.length,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: Responsive.isMobile(context) ? 0.8 : 1,
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
      ),
    );
  }
}
