import 'package:flutter/material.dart';
import 'package:hedspi_learningapp/constant.dart';

class DefaultBtn extends StatelessWidget {
  final VoidCallback onPress;
  final String title;
  final IconData icon;

  const DefaultBtn(
      {Key? key,
      required this.onPress,
      required this.title,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.only(
            left: kDefaultPadding, right: kDefaultPadding),
        padding: const EdgeInsets.only(right: kDefaultPadding),
        width: double.infinity,
        height: 60.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [kSecondaryColor, kPrimaryColor],
              begin: FractionalOffset(0, 0),
              end: FractionalOffset(0.5, 0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              '       $title',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 16.0),
            ),
            const Spacer(),
            Icon(
              icon,
              size: 30.0,
              color: kOtherColor,
            )
          ],
        ),
      ),
    );
  }
}
