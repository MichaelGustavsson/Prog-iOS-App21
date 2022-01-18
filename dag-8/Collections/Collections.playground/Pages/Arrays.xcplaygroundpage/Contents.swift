//: [Previous](@previous)

import Foundation

// Array
// Mutability -> Går att ändra(lägga till och ta bort)
// Immutable -> Går inte att ändra på plats

// Best Practice => skapa arrayer immutable

/*
var vehicles: [String] = []
vehicles.append("Ford")
vehicles.append("Kia")
*/
/*
//Sker oftast när vi får data via backend(REST API)
var vehicles1: [String] = ["Volvo", "Ford", "Volkswagen"]
var vehicles2: [String] = ["BMW", "Mercedes", "Audi"]

var vehicles: [String] = []
vehicles += vehicles1

print(vehicles)

vehicles += vehicles2

print(vehicles)
 */

/*
var dummyArray1: [Int] = Array(repeating: 15, count: 20)
var dummyArray2: [Int] = Array(repeating: 3, count: 5)
var dummyArray3: [String] = Array(repeating: "Kalle", count: 8)
var dummyArray: [Int] = Array()

dummyArray += dummyArray1
dummyArray += dummyArray2
dummyArray += dummyArray3

print(dummyArray)
*/

// Manipulera en Array...
var vehicles: [String] = ["Volvo", "Ford", "Volkswagen"]

// Lägg till nytt element sist i listan...
vehicles.append("BMW")

// Lägg till nytt element på en specifik position i listan...
vehicles.insert("Mercedes", at: 1)

print(vehicles)

// Ta bort element ifrån listan...
// Ta bort ifrån en specifik position...
/*
let removedVehicle = vehicles.remove(at: 1)
print("Du har valt att ta bort \(removedVehicle)")

print(vehicles)

*/
// Ta bort sista elementet...

/*
let removedVehicle = vehicles.removeLast()
print("Du har valt att ta bort \(removedVehicle)")

print(vehicles)
*/

// Ta bort första elementet...
/*
vehicles.removeFirst()

print(vehicles)
*/
// Ta bort element som uppfyller ett villkor...
/*
vehicles.removeAll(where: {$0 == "Volkswagen"})

print(vehicles)
*/

// Hämta ut specifika element ur listan...
// Kallas för subscript syntax...
let vehicle = vehicles[1]

print(vehicle)

// Iterera genom en lista...
for vehicle in vehicles{
    print(vehicle)
}

// Metoden enumerated() konverterar en array till en array av index(offset) och element par
let indexes = vehicles.enumerated()

for index in indexes{
    print(index)
}

for (index, element) in vehicles.enumerated(){
    print("Element på position: \(index) - \(element)")
}

// Michael hur får jag reda på ett elements index, så att jag kan ta bort elementet...
// Absolut enklaste sättet!!!
let idx = vehicles.firstIndex(where: {$0 == "Volkswagen"})
print(idx)











//: [Next](@next)
