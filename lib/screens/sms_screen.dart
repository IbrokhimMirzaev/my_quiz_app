import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_quiz_app/screens/registration_screen.dart';
import '../global_widgets/my_custom_button.dart';
import '../global_widgets/my_custom_input.dart';
import '../utils/icons.dart';
import '../utils/styles.dart';
import '../utils/utility_functions.dart';

class SmsCodeScreen extends StatefulWidget {
  const SmsCodeScreen({Key? key}) : super(key: key);

  @override
  State<SmsCodeScreen> createState() => _SmsCodeScreenState();
}

class _SmsCodeScreenState extends State<SmsCodeScreen> {

  final TextEditingController textEditingController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          title: Text(
            "Otp",
            style: MyTextStyles.inter500
                .copyWith(color: Colors.black, fontSize: 24.sp),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Image.asset(MyIcons.logo),
              SizedBox(height: 60.h),
              Text(
                "Enter your 6 digit otp here",
                style: MyTextStyles.inter500
                    .copyWith(color: Colors.grey.shade400, fontSize: 18.sp),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 90.w),
                child: MyCustomInput(
                  codeLength: 6,
                  textEditingController: textEditingController,
                  focusNode: focusNode,
                  hintText: "Enter SMS code",
                  keyType: TextInputType.phone,
                ),
              ),
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: MyButton(
                  buttonText: "Login",
                  onTap: () {
                    if (textEditingController.text == "123456") {
                      UtilityFunctions.getMyToast(message: "Fill this inputs");
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                            return RegistrScreen();
                          }));
                    } else {
                      UtilityFunctions.getMyToast(message: "Invalid SMS code");
                    }
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Text("login with social media",
                  style: MyTextStyles.inter500
                      .copyWith(color: Colors.grey.shade400, fontSize: 17.sp)),
            ],
          ),
        ));
  }
}
