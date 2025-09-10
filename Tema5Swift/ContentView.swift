import SwiftUI

struct ContentView: View {
    // Un opcional de String
    @State private var nombre: String? = nil
    
    // Colección heterogénea
    let elementos: [Any] = ["Swift", 42, 3.14, true, [1, 2, 3]]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Ejemplo de Opcionales y Conversiones")
                .font(.headline)
            
            // Ejemplo de nil-coalescing
            Text("Bienvenido: \(nombre ?? "Invitado")")
                .padding()
                .background(Color.blue.opacity(0.2))
                .cornerRadius(10)
            
            // Botón para asignar un nombre
            Button("Asignar nombre") {
                nombre = "Ana"
            }
            .buttonStyle(.borderedProminent)
            
            // Botón para borrar el nombre
            Button("Borrar nombre") {
                nombre = nil
            }
            .buttonStyle(.bordered)
            
            Divider()
            
            // Ejemplo de optional binding
            if let nombreSeguro = nombre {
                Text("El nombre desempaquetado es: \(nombreSeguro)")
            } else {
                Text("No hay nombre disponible")
            }
            
            Divider()
            
            // Ejemplo de type casting
            VStack(alignment: .leading) {
                Text("Colección heterogénea:")
                    .font(.subheadline).bold()
                
                ForEach(Array(elementos.enumerated()), id: \.offset) { index, item in
                    if let numero = item as? Int {
                        Text("Elemento \(index): Entero \(numero)")
                    } else if let texto = item as? String {
                        Text("Elemento \(index): Texto \"\(texto)\"")
                    } else if let decimal = item as? Double {
                        Text("Elemento \(index): Decimal \(decimal)")
                    } else if let arreglo = item as? [Int] {
                        Text("Elemento \(index): Arreglo \(arreglo)")
                    } else {
                        Text("Elemento \(index): Otro tipo")
                    }
                }
            }
            .padding()
            .background(Color.green.opacity(0.2))
            .cornerRadius(10)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
