import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:global2/provider/eletroposto_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => EletropostoProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eletropostos Próximos',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Eletropostos Próximos'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer<EletropostoProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.errorMessage.isNotEmpty) {
            return Center(child: Text('Erro: ${provider.errorMessage}'));
          } else {
            return ListView.builder(
              itemCount: provider.eletropostos.length,
              itemBuilder: (context, index) {
                final eletroposto = provider.eletropostos[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          eletroposto.nome,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 5),
                        Text(eletroposto.informacoes),
                        const SizedBox(height: 10),
                        Text('Endereço: ${eletroposto.endereco}'),
                        const SizedBox(height: 5),
                        Text('Telefone: ${eletroposto.telefone}'),
                        const SizedBox(height: 10),
                        Text('Conectores: ${eletroposto.conectores.join(', ')}'),
                      ],
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<EletropostoProvider>().fetchEletropostos(),
        tooltip: 'Carregar Eletropostos',
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
