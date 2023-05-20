import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obichat/cubits/auth_cubits/auth_cubit.dart';
import 'package:obichat/cubits/auth_cubits/auth_state.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Country selectedCountry = Country(
      phoneCode: "91",
      countryCode: "IN",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "India",
      example: "India",
      displayName: "India",
      displayNameNoCountryCode: "IN",
      e164Key: "");
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "REGISTER",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: Colors.green,
                cursorHeight: 20,
                cursorWidth: 2,
                controller: phoneNumberController,
                decoration: InputDecoration(
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(16),
                      child: InkWell(
                        onTap: () {
                          showCountryPicker(
                              countryListTheme: const CountryListThemeData(
                                bottomSheetHeight: 500,),
                              context: context,
                              onSelect: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              });
                        },
                        child: Text(
                          "${selectedCountry.flagEmoji} +${selectedCountry
                              .phoneCode}",
                          style: const TextStyle(fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17),),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white)),
                    hintText: "Enter Phone Number...",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(color: Colors.white))),
              ),
            ),
          ),
          
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if(state is AuthCodeSentState) {
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OtpScreen(),),);
              }
            },
            builder: (context, state) {

              if(state is AuthLoadingState){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return SizedBox(
                width: 145,
                height: 60,
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.green,
                  child: InkWell(
                    onTap: () {
                      String phoneNumber = "+${selectedCountry.phoneCode}${phoneNumberController.text}";
                      BlocProvider.of<AuthCubit>(context).sendOTP(phoneNumber.trim());
                    },
                    borderRadius: BorderRadius.circular(50),
                    splashColor: Colors.green.shade200,
                    child: const Center(child: Text("Continue", style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),)),
                  ),
                ),
              );
          },),
        ],
      ),
    );
  }
}
