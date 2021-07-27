import 'package:flutter/material.dart';
import 'package:my_boilerplate/constants/colors.dart';
import 'package:my_boilerplate/constants/dimens.dart';

class RoundedWidget extends StatelessWidget {
  final child;
  final text;
  const RoundedWidget({
    Key? key,
    this.child,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        height: Dimens.getScaledWidth(context, 0.1),
        width: Dimens.getScaledWidth(context, 0.1),
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(50.0),
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Align(
            alignment: Alignment.center,
            child: text == null
                ? child
                : Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(color: AppColors.mainColor[700]),
                    ),
                  )),
      ),
    );
  }
}
