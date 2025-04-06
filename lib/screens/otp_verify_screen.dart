import 'package:lgbtq_matrimony_app/exports.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verify"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("This OTP screen"),
          InkWell(
            child: const Text("Go to OTP screen"),
            onTap: () {
            context.pop();
            },
          ),
        ],
      ),
    );
  }
}
