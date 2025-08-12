import 'package:flutter/material.dart';

class Atividade0908 extends StatefulWidget {
  const Atividade0908({super.key});

  @override
  State<Atividade0908> createState() => _Atividade0908State();
}

class _Atividade0908State extends State<Atividade0908> {
  // Lista simples para guardar os dados
  List<String> nomes = ['', '', ''];
  List<String> datas = ['', '', ''];
  List<String> sexos = ['', '', ''];

  // Função para selecionar data
  void escolherData(int index) async {
    DateTime? data = await showDatePicker(
      context: context,
      initialDate: DateTime(2000, 1, 1),
      firstDate: DateTime(1900, 1, 1),
      lastDate: DateTime.now(),
    );

    if (data != null) {
      setState(() {
        datas[index] = '${data.day}/${data.month}/${data.year}';
      });
    }
  }

  // Função para validar
  void validar() {
    String resultado = '';
    
    for (int i = 0; i < 3; i++) {
      if (nomes[i].isEmpty) {
        resultado += 'Formulário ${i + 1}: Nome vazio\n';
      } else if (datas[i].isEmpty) {
        resultado += 'Formulário ${i + 1}: Data vazia\n';
      } else if (sexos[i].isEmpty) {
        resultado += 'Formulário ${i + 1}: Sexo vazio\n';
      } else {
        resultado += 'Formulário ${i + 1}: OK - ${nomes[i]}, ${datas[i]}, ${sexos[i]}\n';
      }
    }
    
    // Mostra resultado
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Resultado'),
        content: Text(resultado),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Atividade 09/08'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Título
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.blue[50],
            child: Text(
              'Carrossel de Formulários',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          
          // Lista horizontal
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(20),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  margin: EdgeInsets.only(right: 15),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Título do card
                          Text(
                            'Formulário ${index + 1}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 15),
                          
                          // Nome
                          Text('Nome:', style: TextStyle(fontWeight: FontWeight.bold)),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'Digite o nome',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (valor) {
                              nomes[index] = valor;
                            },
                          ),
                          SizedBox(height: 10),
                          
                          // Data
                          Text('Data de Nascimento:', style: TextStyle(fontWeight: FontWeight.bold)),
                          InkWell(
                            onTap: () => escolherData(index),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.calendar_today),
                                  SizedBox(width: 10),
                                  Text(datas[index].isEmpty ? 'Escolher data' : datas[index]),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          
                          // Sexo
                          Text('Sexo:', style: TextStyle(fontWeight: FontWeight.bold)),
                          DropdownButtonFormField<String>(
                            value: sexos[index].isEmpty ? null : sexos[index],
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            hint: Text('Escolher'),
                            items: [
                              DropdownMenuItem(value: 'Homem', child: Text('Homem')),
                              DropdownMenuItem(value: 'Mulher', child: Text('Mulher')),
                            ],
                            onChanged: (valor) {
                              setState(() {
                                sexos[index] = valor ?? '';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          
          // Botão validar
          Container(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              onPressed: validar,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text('Validar Formulários', style: TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
