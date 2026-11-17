import 'package:fit_track_pro/features/weight/models/weight_model.dart';
import 'package:fit_track_pro/features/weight/screens/add_weight_screen.dart';
import 'package:flutter/material.dart';

// Paso 3: pantalla principal 
class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  // Lista temporal, se borra al cerrar la app
  List<WeightModel> registros = [];

  Future<void> _navigateToAddWeight() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddWeightScreen()),
    );

    if (result != null && result is WeightModel) {
      setState(() {
        registros.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de peso'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: registros.isEmpty
          ? Center(child: Text('No hay registros'))
          : ListView.builder(
              itemCount: registros.length,
              itemBuilder: (context, index) {
                final registro = registros[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(child: Icon(Icons.monitor_weight)),
                    title: Text(
                      registro.fecha,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      '${registro.pesoKilos} kg',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddWeight,
        child: Icon(Icons.add),
      ),
    );
  }
}
