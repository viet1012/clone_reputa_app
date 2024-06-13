import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_button.dart';

class PhonePage extends StatefulWidget {
  static String id = '/PhonePage';

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  bool _showSpinner = false;
  bool _wrongPhone = false;

  String phoneText = 'Phone doesn\'t match';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 60.0, bottom: 20.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 50),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset('assets/logo/logo-reputa1.png'),
                      ),
                      const SizedBox(height: 70),
                      TextField(
                        keyboardType: TextInputType.phone,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          //hintText: 'Password',
                          labelText: 'Số điện thoại',
                          errorText: _wrongPhone ? phoneText : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    text: 'TIẾP TỤC',
                    onTap: () {
                      setState(() {
                        _showSpinner = true;
                      });
                      // Thực hiện các tác vụ khi nút được nhấn
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
          decoration: BoxDecoration(
            color: MyColors.whiteColor,
            border: Border.all(
              color: MyColors.lightGrey1,
              width: 1.0,
            ),
          ),
          child: RichText(
              text: const TextSpan(children: [
            TextSpan(
              text: 'Bằng việc đăng nhập bạn đã đồng ý với ',
              style: TextStyle(
                fontSize: 16.0,
                color: MyColors.lightGrey,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Chính sách bảo mật ứng dụng',
              style: TextStyle(
                fontSize: 16.0,
                color: MyColors.blackColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ])),
        ),
      ]),
    );
  }
}
