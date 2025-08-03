import 'package:flutter/material.dart';

class FormularioValidacao extends StatefulWidget {
  const FormularioValidacao({super.key});

  @override
  State<FormularioValidacao> createState() => _FormularioValidacaoState();
}

class _FormularioValidacaoState extends State<FormularioValidacao> {
  String nome = '';
  DateTime? dataNascimento;
  String? sexo;
  String mensagem = '';

  int calcularIdade() {
    if (dataNascimento == null) return 0;
    
    DateTime hoje = DateTime.now();
    int idade = hoje.year - dataNascimento!.year;
    
    // Ajusta se ainda não fez aniversário este ano
    if (hoje.month < dataNascimento!.month || 
        (hoje.month == dataNascimento!.month && hoje.day < dataNascimento!.day)) {
      idade--;
    }
    
    return idade;
  }

  void selecionarData() async {
    DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1), // Data inicial
      firstDate: DateTime(1900, 1, 1),    // Data mais antiga permitida
      lastDate: DateTime.now(),            // Data mais recente permitida
    );

    if (dataEscolhida != null) {
      setState(() {
        dataNascimento = dataEscolhida;
        verificarIdade();
      });
    }
  }

  void verificarIdade() {
    int idade = calcularIdade();
    
    setState(() {
      if (idade >= 18) {
        mensagem = '✅ Idade válida! Você tem $idade anos.';
      } else {
        mensagem = '❌ Você tem apenas $idade anos. Precisa ter 18 anos ou mais.';
      }
    });
  }

  void enviarFormulario() {
    if (nome.isEmpty) {
      mostrarMensagem('Por favor, digite seu nome completo.');
      return;
    }
    
    if (dataNascimento == null) {
      mostrarMensagem('Por favor, selecione sua data de nascimento.');
      return;
    }
    
    if (sexo == null) {
      mostrarMensagem('Por favor, selecione seu sexo.');
      return;
    }
    
    int idade = calcularIdade();
    if (idade < 18) {
      mostrarMensagem('Você precisa ter 18 anos ou mais para se cadastrar.');
      return;
    }
    
    mostrarMensagem('✅ Formulário enviado com sucesso!');
  }

  void mostrarMensagem(String texto) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(texto),
        backgroundColor: texto.contains('✅') ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividade 02/08 - Validação de Idade'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Título
            Text(
              'Formulário de Cadastro',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),

            // Campo Nome
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              onChanged: (valor) {
                nome = valor;
              },
            ),
            SizedBox(height: 20),

            // Campo Data de Nascimento
            InkWell(
              onTap: selecionarData,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 10),
                    Text(
                      dataNascimento == null 
                          ? 'Selecione sua data de nascimento'
                          : '${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Campo Sexo
            DropdownButtonFormField<String>(
              value: sexo,
              decoration: InputDecoration(
                labelText: 'Sexo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
              ),
              items: [
                DropdownMenuItem(value: 'Homem', child: Text('Homem')),
                DropdownMenuItem(value: 'Mulher', child: Text('Mulher')),
              ],
              onChanged: (valor) {
                setState(() {
                  sexo = valor;
                });
              },
            ),
            SizedBox(height: 20),

            // Mensagem de validação
            if (mensagem.isNotEmpty)
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: mensagem.contains('✅') ? Colors.green[100] : Colors.red[100],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  mensagem,
                  style: TextStyle(
                    color: mensagem.contains('✅') ? Colors.green[800] : Colors.red[800],
                  ),
                ),
              ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: enviarFormulario,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text('Enviar Formulário', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}