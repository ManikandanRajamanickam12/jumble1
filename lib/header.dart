import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: 100,
          color: Colors.black,
          child: Row(
            children: [
              SvgPicture.asset('assets/logo1.svg',
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown),
            ],
          )),
    );
  }
}
