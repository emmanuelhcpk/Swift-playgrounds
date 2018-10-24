import UIKit
//variables con var
var string = "Hello, playground"
//constantes con let
let number : Int = 10
let decimal : Double = 10.00

//casting
let castingExample = Double(number)+decimal
print(castingExample)
//definicion de una funcion
func sumar(first : Int, second: Int) ->Int{
    return first+second
}
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8,13],
    "Square": [1, 4, 9, 16, 25,36],
]

//var largest = Int.min the same than equal 0
var largest = 0

for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print(largest)

print(string+" "+String(sumar(first:2,second:1)))



// clases y structs

struct Estructura {
    var nombre = ""
    var apellido = ""
    
}
class Persona {
    var nombre = ""
    var apellido = ""
    
    // contrstucroes
    init(nombre:String,apellido:String) {
        <#statements#>
        self.nombre = nombre
        self.apellido = apellido
    }
    //final previene la sobreescritura
    final var estatura = 0
    func nombreCompleto() -> String {
        return  self.nombre+" "+self.apellido
    }
    
    //computed properties
    var completo : String{
        get {
            return nombre+apellido
        }
        set{
        
        }
    }
    // computed property solo lectura
    var nombres : String {
        return self.nombre + self.apellido
    }
    
    //observers
    var edad: Int = 0 {
        willSet(nuevaEdad) {
            if(nuevaEdad>=18){
                print("es mayor de edad \(nuevaEdad)")

            }
        }
        didSet {
            if edad > oldValue  {
                print("tiene \(edad - oldValue) anos mas")
            }
        }
    }
    //estaticas propiedades
    static let cedula = "123456789"
}
//algo a destacar es que para poder modificar ateibutos de la estructura tengo q definirla como una variable, en la clase no es necesario
var estructura = Estructura()
var estructuraInicializada = Estructura(nombre:"Emma",apellido:"Velez")
let clase = Persona()
clase.nombre = "Juan"
clase.apellido = "Agudelo"
clase.edad = 20
clase.edad = 28
estructura.nombre = "Pedro"
print("nombre en la clase",clase.nombre,Persona.cedula)
print("nombre en la struct",estructura.nombre)
print("nombre en estructura inicializada", estructuraInicializada.nombre)
print("nombre completo ",clase.nombreCompleto(),clase.completo)

//Arrays
var arreglo = [1,2,3,4]
var umbral = 3
//con map
var menores = arreglo.map({(value:Int) -> Int in
    if(value < umbral){
        return value
    }
    return 0
})
print(menores)
// con filter
menores = arreglo.filter({
    return $0 < umbral
})

print(menores)

//protocol es una especie de interfaz
//
protocol CanShoot {
    func shoot() -> String
}

// I'm a laser beam. I can shoot.
final class LaserBeam: CanShoot {
    func shoot() -> String {
        return "Ziiiiiip!"
    }
}

// I have weapons and trust me I can fire them all at once. Boom! Boom! Boom!
final class WeaponsComposite {
    
    let weapons: [CanShoot]
    
    init(weapons: [CanShoot]) {
        self.weapons = weapons
    }
    
    func shoot() -> [String] {
        return weapons.map { $0.shoot() }
    }
}

let laser = LaserBeam()
var weapons = WeaponsComposite(weapons: [laser])

weapons.shoot()

final class RocketLauncher: CanShoot {
    func shoot() -> String {
        return "Whoosh!"
    }
}

let rocket = RocketLauncher()

weapons = WeaponsComposite(weapons: [laser, rocket])
weapons.shoot()

