import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:technaureus_machine_test/view/core/core.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AppBar(
      leading: Padding(
        padding: EdgeInsets.only(left: size.width*0.04),
        child: const CircleAvatar(
         backgroundImage: AssetImage('assets/images/profile_pic.png'),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Main',
        style: kHeadlineMedium,
      ),
      actions: [
        Padding(
          padding:  EdgeInsets.only(right: size.width*0.04),
          child: const Icon(
              FontAwesomeIcons.barsStaggered,
              color: Colors.black,
              size: 24,
            ),
        ),
        
      ],
    );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
