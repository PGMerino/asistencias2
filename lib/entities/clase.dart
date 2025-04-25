class Clase {
  final String id;
  final String nombre;
  final String aula;
  final String curso;
  final String horario;
  final String profesorId;
  final List<String> alumnosIds;

  Clase({
    required this.id,
    required this.nombre,
    required this.aula,
    required this.curso,
    required this.horario,
    required this.profesorId,
    required this.alumnosIds,
  });

  factory Clase.fromMap(Map<String, dynamic> map) {
    return Clase(
      id: map['id'],
      nombre: map['nombre'],
      aula: map['aula'],
      curso: map['curso'],
      horario: map['horario'],
      profesorId: map['profesorId'],
      alumnosIds: List<String>.from(map['alumnosIds']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'aula': aula,
      'curso': curso,
      'horario': horario,
      'profesorId': profesorId,
      'alumnosIds': alumnosIds,
    };
  }
}

// Lista de datos de ejemplo
List<Clase> clasesExample = [
  Clase(
    id: '1',
    nombre: 'Matemáticas',
    aula: 'A101',
    curso: '1º ESO',
    horario: 'Lunes 9:00-10:00',
    profesorId: '1',
    alumnosIds: ['1', '2', '3'],
  ),
  Clase(
    id: '2',
    nombre: 'Lengua',
    aula: 'B202',
    curso: '2º ESO',
    horario: 'Martes 11:00-12:00',
    profesorId: '2',
    alumnosIds: ['4', '5', '6'],
  ),
  Clase(
    id: '3',
    nombre: 'Historia',
    aula: 'C303',
    curso: '3º ESO',
    horario: 'Miércoles 13:00-14:00',
    profesorId: '1',
    alumnosIds: ['1', '4', '7'],
  ),
];