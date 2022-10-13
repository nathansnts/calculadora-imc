import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

//Função que limpa os dados quando o usuário clica no ícone noi canto superior direito
  void _resetFields() {
    if (weightController.text.isEmpty && heightController.text.isEmpty) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Não há dados informados!',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      weightController.text = '';
      heightController.text = '';
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text(
            'Limpeza realizada com sucesso',
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Ok',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  //Função calcula indice de massa corporal
  void calculateImc() {
    setState(
      () {
        double weight = double.parse(weightController.text);
        double height = double.parse(heightController.text);
        double result = weight / (height * height);
        String resultFormated = result.toStringAsFixed(2);
        //Séries de ifs que fazem o condicionamento e validação sobre cada categoria do imc
        if (result >= 18.50 && result <= 24.99) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Seu IMC atual é $resultFormated\n Peso normal',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (result >= 25.00 && result <= 29.99) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Seu IMC atual é $resultFormated\n Pré Obesidade',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (result >= 30.00 && result <= 34.99) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Seu IMC atual é $resultFormated\n Obesidade de grau I',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (result >= 35.99 && result <= 39.99) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Seu IMC atual é $resultFormated\n Obesidade de grau II',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (result >= 40.00) {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: Text(
                'Seu IMC atual é $resultFormated\n Obesidade de grau III',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                      color: Colors.purple,
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _resetFields();
            },
            icon: const Icon(Icons.restart_alt_outlined),
          ),
        ],
      ),
      // Widget que permite com que seja possível efetuar a rolagem do conteúdo para baixo, caso o teclado sobreponha o conteúdo
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              'D:/Projetos Flutter/calculadora_imc/lib/imgs/img.png',
              height: 75,
            ),
            const SizedBox(
              height: 30,
            ),
            Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite Seu Peso (kg)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                ),
                textAlign: TextAlign.center,
                controller: weightController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            //Formulário para preenchimento de dados de entrada para calculo do imc
            Form(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Digite Sua Altura (cm)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  //contentPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                ),
                textAlign: TextAlign.center,
                controller: heightController,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(15, 45),
                ),
              ),
              onPressed: () {
                if (weightController.text.isEmpty ||
                    heightController.text.isEmpty) {
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text(
                        'Os campos não podem ser vazios!',
                        textAlign: TextAlign.center,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Ok',
                            style: TextStyle(
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  calculateImc();
                }
              },
              child: const Text(
                'Calcular',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
