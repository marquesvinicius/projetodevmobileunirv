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
  bool _isDarkMode = false; // Adicionado para controlar o modo escuro

  int calcularIdade() {
    if (dataNascimento == null) return 0;
    
    DateTime hoje = DateTime.now();
    int idade = hoje.year - dataNascimento!.year;
    
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

  void _alternarBackground() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          'Formulário de Validação',
          style: TextStyle(
            color: _isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: _isDarkMode ? Colors.grey[900] : Colors.grey[100],
        actions: [
          IconButton(
            onPressed: _alternarBackground,
            icon: Icon(
              _isDarkMode ? Icons.light_mode : Icons.dark_mode,
              color: _isDarkMode ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Campo Nome
            TextField(
              onChanged: (value) {
                setState(() {
                  nome = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Nome Completo',
                labelStyle: TextStyle(
                  color: _isDarkMode ? Colors.white70 : Colors.black54,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                ),
              ),
              style: TextStyle(
                color: _isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Campo Data de Nascimento
            InkWell(
              onTap: selecionarData,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _isDarkMode ? Colors.white54 : Colors.black54,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: _isDarkMode ? Colors.white70 : Colors.black54,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      dataNascimento == null
                          ? 'Selecione sua data de nascimento'
                          : 'Data: ${dataNascimento!.day}/${dataNascimento!.month}/${dataNascimento!.year}',
                      style: TextStyle(
                        color: dataNascimento == null
                            ? (_isDarkMode ? Colors.white54 : Colors.black54)
                            : (_isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Campo Sexo
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sexo:',
                  style: TextStyle(
                    color: _isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text(
                          'Masculino',
                          style: TextStyle(
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        value: 'Masculino',
                        groupValue: sexo,
                        onChanged: (value) {
                          setState(() {
                            sexo = value;
                          });
                        },
                        activeColor: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                    Expanded(
                      child: RadioListTile<String>(
                        title: Text(
                          'Feminino',
                          style: TextStyle(
                            color: _isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        value: 'Feminino',
                        groupValue: sexo,
                        onChanged: (value) {
                          setState(() {
                            sexo = value;
                          });
                        },
                        activeColor: _isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Mensagem de idade
            if (mensagem.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: mensagem.contains('✅') 
                      ? (_isDarkMode ? Colors.green[900] : Colors.green[100])
                      : (_isDarkMode ? Colors.red[900] : Colors.red[100]),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  mensagem,
                  style: TextStyle(
                    color: mensagem.contains('✅') 
                        ? (_isDarkMode ? Colors.green[100] : Colors.green[900])
                        : (_isDarkMode ? Colors.red[100] : Colors.red[900]),
                  ),
                ),
              ),
            
            const Spacer(),
            
            // Botão Enviar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: enviarFormulario,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isDarkMode ? Colors.white : Colors.black,
                  foregroundColor: _isDarkMode ? Colors.black : Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Enviar Formulário',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}