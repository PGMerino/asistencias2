class Alumno {
  final String id;
  final String nombre;
  final String apellidos;
  final String curso;
  final String grupo;
  final String email;
  final String telefono;
  final List<String> clasesIds;

  Alumno({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.curso,
    required this.grupo,
    required this.email,
    required this.telefono,
    required this.clasesIds,
  });

  factory Alumno.fromMap(Map<String, dynamic> map) {
    return Alumno(
      id: map['id'],
      nombre: map['nombre'],
      apellidos: map['apellidos'],
      curso: map['curso'],
      grupo: map['grupo'],
      email: map['email'],
      telefono: map['telefono'],
      clasesIds: List<String>.from(map['clasesIds']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'curso': curso,
      'grupo': grupo,
      'email': email,
      'telefono': telefono,
      'clasesIds': clasesIds,
    };
  }

  String get nombreCompleto => '$nombre $apellidos';
}

// Lista de datos de ejemplo
List<Alumno> alumnosExample = [
  Alumno(
    id: '1',
    nombre: 'Pedro',
    apellidos: 'Martínez',
    curso: '1º ESO',
    grupo: 'A',
    email: 'pedro.martinez@escuela.es',
    telefono: '611222333',
    clasesIds: ['1', '3'],
  ),
  Alumno(
    id: '2',
    nombre: 'Ana',
    apellidos: 'Gómez',
    curso: '1º ESO',
    grupo: 'A',
    email: 'ana.gomez@escuela.es',
    telefono: '611444555',
    clasesIds: ['1'],
  ),
  Alumno(
    id: '3',
    nombre: 'Luis',
    apellidos: 'Sánchez',
    curso: '1º ESO',
    grupo: 'B',
    email: 'luis.sanchez@escuela.es',
    telefono: '611666777',
    clasesIds: ['1'],
  ),
  Alumno(
    id: '4',
    nombre: 'Carmen',
    apellidos: 'Rodríguez',
    curso: '2º ESO',
    grupo: 'A',
    email: 'carmen.rodriguez@escuela.es',
    telefono: '622111222',
    clasesIds: ['2', '3'],
  ),
  Alumno(
    id: '5',
    nombre: 'Miguel',
    apellidos: 'Fernández',
    curso: '2º ESO',
    grupo: 'B',
    email: 'miguel.fernandez@escuela.es',
    telefono: '622333444',
    clasesIds: ['2'],
  ),
  Alumno(
    id: '6',
    nombre: 'Laura',
    apellidos: 'Díaz',
    curso: '2º ESO',
    grupo: 'B',
    email: 'laura.diaz@escuela.es',
    telefono: '622555666',
    clasesIds: ['2'],
  ),
  Alumno(
    id: '7',
    nombre: 'Pablo',
    apellidos: 'Ruiz',
    curso: '3º ESO',
    grupo: 'A',
    email: 'pablo.ruiz@escuela.es',
    telefono: '633111222',
    clasesIds: ['3'],
  ),
];