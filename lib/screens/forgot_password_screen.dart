import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _showSpinner = false;
  final TextEditingController _controller = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Lỗi đăng nhập',
            style: TextStyle(
              color: MyColors.primaryColor,
              fontSize: 28,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(
              color: MyColors.primaryColor,
              fontSize: 18,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: MyColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _onSubmit() {
    if (_controller.text.isEmpty) {
      _showErrorDialog('Email không được để trống');
    } else {
      // Thực hiện các tác vụ khi nút được nhấn
      setState(() {
        _showSpinner = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: MyColors.whiteColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Quên mật khẩu",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Điền email bạn cần khôi phục mật khẩu tại đây",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: MyColors.primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {},
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 22.0, // Chỉnh kích thước phông chữ của label ở đây
                ),
              ),
            ),
            const SizedBox(height: 40.0),
            _showSpinner
                ? const CircularProgressIndicator()
                : CustomButton(
                    text: 'TIẾP THEO',
                    onTap: _onSubmit,
                    // Thực hiện các tác vụ khi nút được nhấn
                  ),
          ],
        ),
      ),
    );
  }
}
