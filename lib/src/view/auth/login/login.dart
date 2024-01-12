import 'package:campus170_2/src/utils/components/app_button.dart';
import 'package:campus170_2/src/utils/enums/enums.dart';
import 'package:campus170_2/src/utils/style/app_colors.dart';
import 'package:campus170_2/src/utils/style/app_dimentions.dart';
import 'package:campus170_2/src/view/base/base_body.dart';
import 'package:campus170_2/src/view/base/base_scaffold.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  static const String routeName = 'auth.login.view';

  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      addbodyPadding: true,
      body: BaseBody(
        key: widget.key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: AppDimentions.k20 * 3),
              child: Image.asset('assets/images/Illustration.png'),
            ),
            AppDimentions.space(),
            const SizedBox(
              width: 280,
              child: Text(
                'Connect easily with your family and friends over countries',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF0F1828),
                  fontSize: 24,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            AppDimentions.space(MediaQuery.of(context).size.height / 4),
            const Text(
              'Terms & Privacy Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF0F1828),
                fontSize: 14,
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
              ),
            ),
            AppDimentions.space(),
            AppButton(
              buttonType: ButtonType.LONG_BTN,
              btnColor: AppColors.kprimaryColor200,
              btnText: 'Connect',
            )
          ],
        ),
      ),
    );
  }
}
