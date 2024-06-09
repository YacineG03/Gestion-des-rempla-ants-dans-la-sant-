import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget{
  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen>{
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page de connexion"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20,vertical: 60),
          key: _formField,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset(
                "images/logo.png",
                height: 200,
                width: 200,
                ),
                SizedBox( height: 50),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: "Adresse email",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),

                  ),
                  validator: (value){
                    bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);

                    if (value.isEmpty) {
                      return "Veuillez saisir votre adresse email";
                    }
                    else if (!emailValid) {
                      return "Veuillez entre une adresse email vailde";
                    }
                  
                 
                  },
                ),
                SizedBox( height: 20),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    labelText: "Mot de passe",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                      setState(() {
                        setState(() {
                        passToggle = !passToggle;                        
                        });

                      });
                      },
                      child:  Icon(passToggle ? Icons.visibility :Icons.visibility_off),
                    )
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Veuillez entrer le mot de passe";
                    }
                    else if(passwordController.text.length < 6){
                      return "le mot de passe doit etre plus petit que de 6 caracteres";
                    }
                  },
                ),
              SizedBox(height: 60),
              InkWell(
                onTap: (){
                  if (_formField.currentState!.validate()) {
                    print("COnnexion reussie");
                    emailController.clear();
                    passwordController.clear();
                  }
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 93, 4),
                    borderRadius:  BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Text("Log In", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Vous n'avez pas de compte?",
                  style: TextStyle(
                      fontSize: 17,
                    )
                  ),
                  TextButton(onPressed: (){}, child: Text(
                    "Inscrivez-vous",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    )),
                ],
              )
            ],
          )
        )
      ), 
    ),
  );
  }
}