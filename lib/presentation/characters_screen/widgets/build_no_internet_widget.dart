import 'package:bloc_demo/constants/colors.dart';
import 'package:flutter/material.dart';

class BuildNoInternetWidget extends StatelessWidget {
  const BuildNoInternetWidget({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Can\'t connect .. check internet',
              style: TextStyle(
                fontSize: 22,
                color: MyColors.myGrey,
              ),
            ),
            Image.asset(
              'assets/images/no_internet.png',
            )
          ],
        ),
      ),
    );
  }
}
