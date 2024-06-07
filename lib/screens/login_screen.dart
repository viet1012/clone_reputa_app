import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_button.dart';

class LoginPage extends StatefulWidget {
  static String id = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showSpinner = false;

  bool _wrongEmail = false;
  bool _wrongPassword = false;
  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';

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
                      const SizedBox(height: 50),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          // hintText: 'Email',
                          labelText: 'Email / tên đăng nhập',
                          errorText: _wrongEmail ? emailText : null,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        obscureText: true,
                        keyboardType: TextInputType.visiblePassword,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          //hintText: 'Password',
                          labelText: 'Mật khẩu',
                          errorText: _wrongPassword ? passwordText : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  CustomButton(
                    text: 'ĐĂNG NHẬP',
                    onTap: () {
                      setState(() {
                        _showSpinner = true;
                      });
                      // Thực hiện các tác vụ khi nút được nhấn
                    },
                  ),
                  const SizedBox(height: 20),
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Quên mật khẩu? ',
                      style: TextStyle(
                          fontSize: 18.0,
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _showSpinner = true;
                      });
                      // Thực hiện các tác vụ khi nút được nhấn
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      height: 60,
                      decoration: BoxDecoration(
                        color: MyColors.whiteColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: MyColors.primaryColor,
                          width: 2.0,
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          'ĐĂNG NHẬP VỚI SỐ ĐIỆN THOẠI',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: MyColors.primaryColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
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
