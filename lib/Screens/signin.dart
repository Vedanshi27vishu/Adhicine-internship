import 'package:flutter/material.dart';
import 'package:internship/Controllers/signin_controller.dart';
import 'package:internship/Screens/signup.dart';
import 'package:internship/User/usermodel.dart';
import 'package:internship/User/userrepo.dart';
import 'package:internship/Utils/Helper/helpersfunctions.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    bool dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Center(
                child: Container(
                    width: 100,
                    height: 100,
                    child: Image(image: AssetImage("assets/Images/logo.jpeg"))),
              ),
              SizedBox(
                height: 50,
              ),
              Text('Sign In',
                  style:
                      TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.0),
              TextFormField(
                 controller: SigninController.email,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: SigninController.password,
                obscureText: isvisible,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock_outline),
                    labelText: "Password",
                    suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            isvisible = !isvisible;
                          });
                        },
                        child: isvisible
                            ? Icon(
                                Icons.visibility_off,
                                color: Colors.grey,
                              )
                            : Icon(
                                Icons.visibility,
                                color: Colors.grey,
                              ))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 180),
                child: TextButton(
                  child: Text("Forgot Password?"),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 16.0),
              Container(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () 
                    async {
                      UserModel? usermodel = await UserRepository.getuseremail(
                          SigninController.email.text);
                      SigninController.SignIn(
                          usermodel!,
                          SigninController.email.text,
                          SigninController.password.text,
                          context);
                  },
                  child: Text(
                    'Sign In',
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                      child: Divider(
                          color: dark ? Colors.grey : Colors.blueGrey,
                          thickness: 0.5,
                          endIndent: 5)),
                  Text("OR", style: Theme.of(context).textTheme.labelMedium),
                  Flexible(
                      child: Divider(
                    color: dark ? Colors.grey : Colors.blueGrey,
                    thickness: 0.5,
                    indent: 5,
                  )),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                height: 50,
                width: double.infinity,
                child: OutlinedButton( 
                  onPressed: () async {
                     UserModel? usermodel = (await UserRepository.signInGoogle(context)) as UserModel?;
                      SigninController.SignIn(
                          usermodel!,
                          SigninController.email.text,
                          SigninController.password.text,
                          context);
                  },
                child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage("assets/Images/icons8-google-48.png"),height: 30,),
                            SizedBox(width: 5,),
                            Text('Continue with Google',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                          ],
                        ), 
                ),
              ),
              SizedBox(height: 16.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('New to Adhicine?'),
                TextButton(
                  onPressed: () {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Signup()));
                  },
                  child: Text('Sign Up'),
                ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
