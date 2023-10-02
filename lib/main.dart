import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyStepperForm(),
    );
  }
}

class MyStepperForm extends StatefulWidget {
  const MyStepperForm({Key? key});

  @override
  MyStepperFormState createState() => MyStepperFormState();
}

class MyStepperFormState extends State<MyStepperForm> {
  int _currentStep = 0;

  // Chave global para validar o formulário no primeiro passo
  final formKeyStep1 = GlobalKey<FormState>();

  // Chave global para validar o formulário no segundo passo
  final formKeyStep2 = GlobalKey<FormState>();

  // Controladores de texto para os campos do primeiro formulário (Step 1)
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  // Controladores de texto para os campos do segundo formulário (Step 2)
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _neighborhoodController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _complementController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário em Stepper'),
        backgroundColor: const Color.fromARGB(255, 81, 15, 83),
      ),
      body: SafeArea(
      child: Theme(
        data: ThemeData(
          canvasColor: Colors.yellow,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: const Color.fromARGB(255, 81, 15, 83),
              ),
        ),
        child: Stepper(
        currentStep: _currentStep,
        onStepContinue: () {
          if (_currentStep == 0) {
            if (formKeyStep1.currentState!.validate()) {
              setState(() {
                _currentStep++;
              });
            }
          } else if (_currentStep == 1) {
            if (formKeyStep2.currentState!.validate()) {
              setState(() {
                _currentStep++;
              });
            }
          }
          else if (_currentStep == 2) {
            if (formKeyStep2.currentState!.validate()) {
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.green,
                            content: Text('Válido')),
                      );
              });
            }
          }
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              _currentStep--;
            }
          });
        },
        steps: [
          Step(
            title: const Text('Passo 1'),
            isActive: _currentStep == 0,
            content: Form(
              key: formKeyStep1,
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Color.fromARGB(255, 81, 15, 83),
                ),
                hintText: 'Digite seu Nome',
                labelText: 'Nome',
                labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                enabledBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide:
                      BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o Nome';
                      }
                      if (!RegExp(r"^[A-Z][a-zA-Z]{6,}$").hasMatch(value)) {
                        return 'Nome deve começar com letra maiúscula e ter pelo menos 7 caracteres';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 81, 15, 83),
                        ),
                      hintText: 'Digite seu E-mail',
                      labelText: 'E-mail',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                          BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide:
                        BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o E-mail';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                        return 'Email deve estar em um formato válido';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Passo 2'),
            isActive: _currentStep == 1,
            content: Form(
              key: formKeyStep2,
              child: Column(
                children: [
                  TextFormField(
                    controller: _streetController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.maps_home_work,
                        color: Color.fromARGB(255, 81, 15, 83),
                        ),
                      hintText: 'Digite sua Rua',
                      labelText: 'Rua',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                          BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide:
                        BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite a Rua';
                      }
                      if (!RegExp(r"^[A-Z][a-zA-Z]").hasMatch(value)) {
                        return 'Rua deve começar com maiúscula';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _neighborhoodController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.maps_home_work,
                        color: Color.fromARGB(255, 81, 15, 83),
                        ),
                      hintText: 'Digite seu Bairro',
                      labelText: 'Bairro',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                          BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide:
                        BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o Bairro';
                      }
                      if (!RegExp(r"^[A-Z][a-zA-Z]").hasMatch(value)) {
                        return 'Bairro deve começar com maiúscula';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.onetwothree_outlined,
                        color: Color.fromARGB(255, 81, 15, 83),
                        ),
                      hintText: 'Digite seu Número',
                      labelText: 'Número',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                          BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide:
                        BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o Número';
                      }
                      if (!RegExp(r'^[1-9]\d*$').hasMatch(value)) {
                        return 'Digite somente números';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _complementController,
                    decoration: const InputDecoration(
                      icon: Icon(
                        Icons.abc,
                        color: Color.fromARGB(255, 81, 15, 83),
                        ),
                      hintText: 'Digite seu Complemento',
                      labelText: 'Complemento',
                      labelStyle: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                          BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      focusedBorder: UnderlineInputBorder(
                      borderSide:
                        BorderSide(color: Color.fromARGB(255, 81, 15, 83)),
                      )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor digite o Complemento';
                      }
                      if (!RegExp(r"^[a-zA-Z0-9\s]*$").hasMatch(value)) {
                        return 'Complemento deve ser só letras ou números';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          Step(
            title: const Text('Passo 3'),
            content: Column(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.person, size: 14),
                        style: TextStyle(color: Color.fromARGB(255, 81, 15, 83))
                      ),
                      TextSpan(
                        text: " Nome: ${_nameController.text}",
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.mail, size: 14),
                      ),
                      TextSpan(
                        text: " Email: ${_emailController.text}",
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.maps_home_work, size: 14),
                        style: TextStyle(color: Color.fromARGB(255, 81, 15, 83))
                      ),
                      TextSpan(
                        text: " Rua: ${_streetController.text}",
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.maps_home_work, size: 14),
                        style: TextStyle(color: Color.fromARGB(255, 81, 15, 83))
                      ),
                      TextSpan(
                        text: " Bairro: ${_neighborhoodController.text}",
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.onetwothree_outlined),
                        style: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      TextSpan(
                        text: " Número: ${_numberController.text}",
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const WidgetSpan(
                        child: Icon(Icons.abc),
                        style: TextStyle(color: Color.fromARGB(255, 81, 15, 83)),
                      ),
                      TextSpan(
                        text: " Complemento: ${_complementController.text}",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            isActive: _currentStep == 2,
          ),
        ],
      ),
      )
      ) 
      
      
    );
  }
}
