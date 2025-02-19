import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gate_africa/constants/app_texts.dart';
import 'package:gate_africa/constants/utils/app_assets.dart';
import 'package:gate_africa/constants/utils/app_color.dart';
import 'package:gate_africa/constants/utils/app_nav.dart';
import 'package:gate_africa/constants/utils/function_file.dart';
import 'package:gate_africa/constants/widgets/auth_header.dart';
import 'package:gate_africa/constants/widgets/button_widget.dart';
import 'package:gate_africa/constants/widgets/text_field_box.dart';
import 'package:gate_africa/constants/widgets/text_widget.dart';
import 'package:gate_africa/core/api_calls/all_api_calls.dart';
import 'package:gate_africa/model/auth/body/login_params.dart';
import 'package:gate_africa/model/auth/response/authentication_model.dart';
import 'package:gate_africa/model/profile/responses/user_details_model.dart';
import 'package:gate_africa/models/auth/body/login_flow_params.dart';
import 'package:gate_africa/provider/source/local_source_provider/source_provider_local.dart';
import 'package:gate_africa/provider/state_notifier/auth_state_notifier.dart';
import 'package:gate_africa/screens/authentications/biometric/bio_choice.dart';
import 'package:gate_africa/screens/authentications/biometric/biometeric_screen.dart';
import 'package:gate_africa/screens/authentications/create_pin/create_pin.dart';
import 'package:gate_africa/screens/authentications/forgot_password/forgot_password.dart';
import 'package:gate_africa/screens/authentications/register/register_screen.dart';
import 'package:gate_africa/screens/authentications/verifications/email_verification.dart';
import 'package:gate_africa/screens/dashboard/main_page.dart';
import 'package:gate_africa/screens/join_estate/welcome_to_estate.dart';
import 'package:gate_africa/state/auth/auth_state.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:local_auth/local_auth.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, required this.welcomeBackPage});
  final int welcomeBackPage;
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with WidgetsBindingObserver {
  bool isButtonEnabled = false;
  bool isPasswordVisible = false;
  String userpass = "";
  int? activebio = 0;
  String email = "";
  String fname = "";
  String uname = "";
  String pno = "";
  final LocalAuthentication auth = LocalAuthentication();
  ProviderContainer container = ProviderContainer();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    emailController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  Future<void> _handleData(WidgetRef ref) async {
    String pass = passwordController.text;
    if (userpass.isNotEmpty) {
      pass = userpass;
    }

    ref
        .read(loginNotifierProvider.notifier)
        .login(LoginParams(email: emailController.text, password: pass));
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          widget.welcomeBackPage == 0
              ? (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty)
              : passwordController.text.isNotEmpty;
    });
  }

  int keeploading = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Consumer(
          builder: (context, ref2, child) {
            return SingleChildScrollView(
              child: SafeArea(
                child: SizedBox(
                  height: size.height.sp - size.height / 8,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 15.sp,
                      right: 15.sp,
                      bottom: 15.sp,
                      top: 60.sp,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ////////////////////////////////////////////////////////////////
                            /// PHASE 1: Header TEXT
                            ///////////////////////////////////////////////////////////////
                            if (widget.welcomeBackPage == 1)
                              AuthHeader(
                                headText: "Welcome back \n",
                                headText2: pno,
                                bodyFontWeight: FontWeight.w400,
                                headFontSize: 14.sp,
                                showCloseButton: false,
                                headTextColor: GateAfricaColors.greyText,
                                headTextColor2: GateAfricaColors.greenText,
                                bodyTextColor2: GateAfricaColors.greenText,
                                bodyOnTap: () {},
                                bodyText: "Enter your password to proceed.",
                              )
                            else
                              AuthHeader(
                                bodyWidth: 280.sp,
                                headText: "Welcome back 👋",
                                headTextColor: GateAfricaColors.greenText,
                                bodyText2: '',
                                showCloseButton: false,
                                bodyFontWeight: FontWeight.w400,
                                bodyTextColor2: GateAfricaColors.greenText,
                                bodyOnTap: () {},
                                bodyText:
                                    "Enter your details below to continue.",
                              ),
                            SizedBox(height: 30.sp),

                            ////////////////////////////////////////////////////////////////
                            /// PHASE 2: TEXT FIELDS
                            ///////////////////////////////////////////////////////////////
                            if (widget.welcomeBackPage != 1)
                              Column(
                                children: [
                                  SizedBox(
                                    child: TextFieldBox(
                                      controller: emailController,
                                      headText: "Email Address",
                                      hintText: "Your Email Address",
                                      keyboardType: TextInputType.emailAddress,
                                    ),
                                  ),
                                  SizedBox(height: 15.sp),
                                ],
                              ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: TextFieldBox(
                                    controller: passwordController,
                                    headText: "Password",
                                    hintText: "Password",
                                    obscureText: !isPasswordVisible,
                                    suffixIcon: Icon(
                                      isPasswordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color: GateAfricaColors.greyText,
                                    ),
                                    onIconPressed: () {
                                      setState(() {
                                        isPasswordVisible = !isPasswordVisible;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 10.sp),
                                Row(
                                  mainAxisAlignment:
                                      widget.welcomeBackPage != 1
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        nextScreen(
                                          context,
                                          const ForgotPasswordScreen(),
                                        );
                                      },
                                      child: Center(
                                        child: GateAfricaText(
                                          text: "Forgot Password?",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          textColor: GateAfricaColors.greenText,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 30.sp),

                            ////////////////////////////////////////////////////////////////
                            /// Biometric Icon
                            ///////////////////////////////////////////////////////////////
                            if (widget.welcomeBackPage == 1 && activebio == 1)
                              GestureDetector(
                                onTap: () {
                                  showBiomTeric();
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Image.asset(
                                        GateAfricaAssetsPath.fingerprintIcon,
                                        height: 48.sp,
                                        width: 44.sp,
                                      ),
                                    ),
                                    SizedBox(height: 20.sp),

                                    ////////////////////////////////////////////////////////////////
                                    /// PHASE 5: Other Options Text
                                    ///////////////////////////////////////////////////////////////
                                    Center(
                                      child: GateAfricaText(
                                        text: "Login with fingerprint",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        textColor: GateAfricaColors.greyText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),

                        ///***************************************************************** */
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ////////////////////////////////////////////////////////////////
                            /// PHASE 4: BUTTONS
                            /// FOOTER SECTION
                            ///////////////////////////////////////////////////////////////
                            if (loginState is LoginLoadingState ||
                                loginState is LoginSuccessState ||
                                keeploading == 1)
                              AppLoadingButton(
                                height: 50.sp,
                                width: size.width.sp,
                              )
                            else
                              ButtonGateAfrica(
                                onClick: () {
                                  if (isButtonEnabled) {
                                    _handleData(ref);
                                  } else {
                                    modalNotification(
                                      message: 'Please fill all fields',
                                      context: context,
                                      isError: true,
                                    );
                                  }
                                },
                                backgroundColor:
                                    isButtonEnabled
                                        ? GateAfricaColors.greenButtonColor
                                        : GateAfricaColors.disabledButton,
                                textColor:
                                    isButtonEnabled
                                        ? GateAfricaColors.whiteText
                                        : GateAfricaColors.blackText,
                                width: size.width.sp,
                                text: "Login",
                                fontSize: 18.sp,
                                height: 56.sp,
                                radius: 10.r,
                              ),
                            SizedBox(height: 10.sp),

                            ////////////////////////////////////////////////////////////////
                            /// PHASE 5: Other Options Text
                            ///////////////////////////////////////////////////////////////
                            Column(
                              children: [
                                if (widget.welcomeBackPage != 1) ...[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GateAfricaText(
                                        text: "Don’t have an account?",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        textColor: GateAfricaColors.greyText,
                                      ),
                                      SizedBox(width: 2.sp),
                                      GestureDetector(
                                        onTap: () {
                                          nextScreenReplace(
                                            context,
                                            const RegisterScreen(),
                                          );
                                        },
                                        child: GateAfricaText(
                                          text: "Register",
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w400,
                                          textColor: GateAfricaColors.greenText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ] else ...[
                                  GestureDetector(
                                    onTap:
                                        () => nextScreenReplace(
                                          context,
                                          const LoginScreen(welcomeBackPage: 0),
                                        ),
                                    child: Center(
                                      child: GateAfricaText(
                                        text: "Log into another account?",
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        textColor: GateAfricaColors.greyText,
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                            SizedBox(height: 10.sp),

                            Center(
                              child: GateAfricaText(
                                text: MainAppTextClass.version,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                textColor: GateAfricaColors.greyText,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
