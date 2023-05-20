import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obichat/screens/home_screen.dart';
import 'package:obichat/screens/user_info_screen.dart';
import 'package:obichat/theme.dart';
import 'package:obichat/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../cubits/auth_cubits/auth_cubit.dart';
import '../../cubits/auth_cubits/auth_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/check.png',
                width: 90,
                height: 90,
              ),
              const SizedBox(
                height: 26,
              ),
              const Text(
                "Verification",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Enter OTP sent to your mobile number",
                style: TextStyle(
                  fontSize: 15.0,
                  color: AppColors.textFaded,
                ),
              ),
              const SizedBox(height: 30.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Pinput(
                  controller: otpController,
                  keyboardType: TextInputType.phone,
                  onTap: () {},
                  obscureText: true,
                  length: 6,
                  defaultPinTheme: PinTheme(
                    width: 70,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.greenAccent.shade100)),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {

                  if (state is AuthLoggedInState) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (context) => HomeScreen(),),);
                  }else if(state is AuthErrorState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error, style: const TextStyle(color: Colors.white),), backgroundColor: Colors.red, duration: const Duration(milliseconds: 600)
                        ,),
                    );
                  }
                },
                builder: (context, state) {

                  if(state is AuthLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return SizedBox(
                    height: 50,
                    width: 100,
                    child: Material(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(40),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(40),
                          onTap: () {
                            BlocProvider.of<AuthCubit>(context).verifyOTP(otpController.text);
                          },
                          splashColor: Colors.green.shade400,
                          child: const Center(
                            child: Text(
                              "Verify",
                              style: TextStyle(fontSize: 17),
                            ),
                          )),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Didn't receive? ",
                    style: TextStyle(
                        color: AppColors.textFaded,
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Resend code",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
