import Foundation

/* Variabler och konstanter */
//Variabler = förändringsbar, ändra värdet på variabeln
var make = "Volvo"
var mileage : Int = 98000
var model : String

//Går inte att ändra typ när värdet en gång är satt...
//make = 259999

model = "V40"
model = "V60"

//Constant
//let är då en variabel som inte går att ändra därför använder vi camelCase
let modelYear = 2018

//Går inte
//modelYear = 2017

//print(make)
//print(model)
//print(mileage)
//print(modelYear)

// String interpolation \()
//print("Bilen är tillverkad av \(make), modellen är \(model), är av årsmodell \(modelYear), har gått \(mileage) km")

/* Funktioner för att manipulera strängar */
make.lowercased()
make.uppercased()
make.count

/* Flyttal */
var consumption : Double = 0.75
var test1 : Decimal = 1.5654467788898765434567898765434567898765434567897654
var test2 : Double = 1.5654467788898765434567898765434567898765434567897654
var test3 : Float = 1.5654467788898765434567898765434567898765434567897654

/* Boolean */
var isCheckedIn : Bool = true
isCheckedIn = false

/* Listor / Collections */
// Array
var manufacturors = ["Volvo", "Kia", "Fiat", "Mercedes"]
manufacturors.count

//Lägg till ett nytt element sist
manufacturors.append("Toyota")
//Lägg till ett nytt element på en bestämd position
manufacturors.insert("BMW", at: 1)
//Ta bort ett element för en bestämd position
manufacturors.remove(at: 5)
manufacturors
manufacturors.reverse()
manufacturors.sorted()

manufacturors[2]
//manufacturors.contains(where: "Fiat")
let index = manufacturors.firstIndex(of: "Fiatar")
manufacturors[index ?? 1]

//Går ej att blanda olika datatyper i en array
//manufacturors.append(10)

var numbers : [Int] = [1,2,3,4,5,6,7,8,9]

/* Iterationer / loopar */

for _ in manufacturors{
    print("Tjohoo")
}

manufacturors.count

//make är en lokal variabel som bara existerar i for scopet...
for make in manufacturors{
    print("Tjohoo \(make)")
}

//Snurra igenom från 1 till och med 100
for number in 1...100{
    print(number)
}

//Snurra igenom från 1 men strunta i värdet 100
for number in 1..<100{
    print(number)
}

var newList : [Int] = []
for x in 1...1000{
    if(x > 992){
        newList.append(x)
    }
}

newList

//Dictionaries
//Består nyckel(key) och värde(value)
var dogs = ["Ruth": 6, "Billie": 8, "Fiona": 4]

dogs["Fiona"]

dogs["Liza"] = 12

dogs["Ruth"] = 7

dogs

dogs.removeValue(forKey: "Liza")
dogs

var vehicles: [String:String] = ["ABC123" : "Volvo V60", "EDF456": "Kia Ceed"]

vehicles["ABC123"]

/* Sets och Tuples */
//Tuples...
//Ett värde som håller två delar information...
var dog1 = ("Liza", 12)
dog1.0
dog1.1

var dog2 = ("Liza", 12, "Fiona", 4)
dog2.0
dog2.1
dog2.2
dog2.3

//Sets
//Kan inte ha dubbletter...
//Ordningen i ett Set har ingen betydelse och kan ändras ifrån
//körning till körning
var moviesArray = ["Star Wars", "Star Trek", "Batman Begins", "Star Trek", "Star Trek"]
var moviesSet: Set = ["Star Wars", "Star Trek", "Batman Begins", "Star Trek", "Star Trek"]
moviesArray

moviesSet.count
moviesSet.contains("Batman Begins")

moviesSet.insert("Thor")
moviesSet.insert("Thor")

for movie in moviesSet{
    print(movie)
}

print("----------------------------------------")
/* if och else */
if isCheckedIn{
    print("Bilen är incheckad för genomgång")
} else {
    print("Bilen är inte klar för genomgång")
}

/* Switch */
var number = 30
switch number {
case 1..<10:
    print("Mellan 1 och 10")
    break
case 10...20:
    print("Mellan 10 och 21")
    break
default:
    print("Det vart något annat!")
}

print("----Funktioner---------------------------------------------")
/* Funktioner Swift */
func sayHello() {
    print("Hej på dig kompis!")
}

sayHello()

//Funktion med argument...
func sayHello(name: String) {
    print("Hej på dig \(name)!")
}

sayHello(name: "Kålle")

//Funktion med flera argument...
func sayHello(firstName: String, lastName: String) {
    print("Hej på dig \(firstName) \(lastName)!")
}

sayHello(firstName: "Bosse", lastName: "Kofot")

//Funktioner som returnera ett värde
func sayHello(firstName: String, lastName: String, address: String) -> String {
    return ("Hej på dig \(firstName) \(lastName)! din adress är \(address)")
}

let result = sayHello(firstName: "Bosse", lastName: "Kofot", address: "Härlanda")
print(result)

print("--- Optionals -----------------------------------------------")
var name: String? = "Bosse Kofot"
name = nil

var newName: String = name ?? "Nisse"
print("Detta är ditt namn \(newName)")

//Safe coding...
//Det mindre snygga sättet...
if(name != nil){
    print(name)
}

//Det rekommenderade sättet...
print("--Det rekommendare sättet-----------------------------------")
if let myName = name{
    print(myName)
}


struct Vehicle: Hashable {
    var regNo: String
    var make: String
    var model: String
    var modelYear: Int
    
    init(regNo: String, make: String, model: String, modelYear: Int){
        self.regNo = regNo
        self.make = make
        self.model = model
        self.modelYear = modelYear
    }
}

var cars = Set<Vehicle>()

print(cars.count)

cars.insert(Vehicle(regNo: "abc233", make: "Volvo", model: "V50", modelYear: 2010))
cars.insert(Vehicle(regNo: "abc233", make: "Volvo", model: "V50", modelYear: 2010))
cars.insert(Vehicle(regNo: "def345", make: "Volvo", model: "V50", modelYear: 2010))
print(cars.count)

