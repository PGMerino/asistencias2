class Profesor {
  final String id;
  final String nombre;
  final String apellidos;
  final String email;
  final String telefono;
  final String departamento;
  final String imageUrl;
  final List<String> clasesIds;

  Profesor({
    required this.id,
    required this.nombre,
    required this.apellidos,
    required this.email,
    required this.telefono,
    required this.departamento,
    required this.imageUrl,
    required this.clasesIds,
  });

  factory Profesor.fromMap(Map<String, dynamic> map) {
    return Profesor(
      id: map['id'],
      nombre: map['nombre'],
      apellidos: map['apellidos'],
      email: map['email'],
      telefono: map['telefono'],
      departamento: map['departamento'],
      imageUrl: map['imageUrl'],
      clasesIds: List<String>.from(map['clasesIds']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'apellidos': apellidos,
      'email': email,
      'telefono': telefono,
      'departamento': departamento,
      'imageUrl': imageUrl,
      'clasesIds': clasesIds,
    };
  }

  String get nombreCompleto => '$nombre $apellidos';
}

// Lista de datos de ejemplo
List<Profesor> profesoresExample = [
  Profesor(
    id: '1',
    nombre: 'Juan',
    apellidos: 'Pérez',
    email: 'juan.perez@escuela.es',
    telefono: '666111222',
    departamento: 'Matemáticas',
    imageUrl: 'assets/images/profesor1.png',
    clasesIds: ['1', '3'],
  ),
  Profesor(
    id: '2',
    nombre: 'María',
    apellidos: 'López',
    email: 'maria.lopez@escuela.es',
    telefono: '666333444',
    departamento: 'Lengua',
    imageUrl: 'assets/images/profesor2.png',
    clasesIds: ['2'],
  ),
  Profesor(
    id: '3',
    nombre: 'Carlos',
    apellidos: 'García',
    email: 'carlos.garcia@escuela.es',
    telefono: '666555666',
    departamento: 'Ciencias',
    imageUrl: 'assets/images/profesor3.png',
    clasesIds: [],
  ),
];