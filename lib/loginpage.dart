import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // 배열 인덱스
  // 0 : username
  // 1 : email
  // 2 : password
  List<TextEditingController> controller = [TextEditingController(), TextEditingController(), TextEditingController()];

  // validation username, email, password에 시행
  // 로직구현 안함(username은 파이어베이스 필요)
  ValidateUsername(String? value){
    if (value?.isEmpty ?? true) return 'Empty!';
    if (value!.contains(RegExp(r'[0-9]'))) return 'Number is not allowed!';
    return null;
  }
  ValidateEmail(String? value){
    if (value?.isEmpty ?? true) return 'Empty!';
    if (value!.contains(RegExp(r'[0-9]'))) return 'Number is not allowed!';
    return null;
  }
  ValidatePassword(String? value){
    if (value?.isEmpty ?? true) return 'Empty!';
    if (value!.contains(RegExp(r'[0-9]'))) return 'Number is not allowed!';
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('로그인하기'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: controller[0],
                      decoration: const InputDecoration(labelText: '닉네임'),
                      validator: (String? value) {
                        return ValidateUsername(value);
                      },
                    ),
                    TextFormField(
                      controller: controller[1],
                      decoration: const InputDecoration(labelText: '이메일주소'),
                      validator: (String? value) {
                        return ValidateEmail(value);
                      },
                    ),
                    TextFormField(
                      controller: controller[2],
                      decoration: const InputDecoration(labelText: '비밀번호'),
                      validator: (String? value) {
                        return ValidatePassword(value);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: ElevatedButton(
                        onPressed: () => setState(() {
                            bool validationResult = formKey.currentState?.validate() ?? false;
                            //validation 문제없으면 시행
                            //현재는 그냥 콘솔에 출력
                            if(validationResult){
                              print('name : ' + controller[0].text);
                              print('email : ' + controller[1].text);
                              print('password : ' + controller[2].text);
                            }
                          },
                        ),
                        child: const Text('로그인'),
                      ),
                    ),

                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
