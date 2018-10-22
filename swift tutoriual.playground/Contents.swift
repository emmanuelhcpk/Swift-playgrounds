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


