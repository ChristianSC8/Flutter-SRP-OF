class Reserva {
  final int id;
  final DateTime fechaInicio;

  Reserva({required this.id, required this.fechaInicio /* Otros parámetros aquí */});

  factory Reserva.fromJson(Map<String, dynamic> json) {
    return Reserva(
      id: json['id'],
      fechaInicio: DateTime.parse(json['fechaInicio']),
      // Parsea otros campos según sea necesario
    );
  }
}
