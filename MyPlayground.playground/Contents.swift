import UIKit

var str = "Hello, playground"

let constStr = str

var hasPet = true

var arrayOfInts: Array<Int> = []
var arrayOfString:[String] = []
//var dictionaryOfCapitalsByCountry: Dictionary<String, String> = [:]
var dictionaryOfCapitaclsByCountry: [String: String] = [:]
var winningLotteryNumbers: Set<Int> = []

var countingUp = ["one", "two"]
let nameByParkingSpace = [13: "Alice", 27: "Bob"]

let secondElement = countingUp[1]
countingUp.count
countingUp.append("three")

let emptyString = String()

emptyString.isEmpty

// Optionals
var anOptionalFloat: Float?
var anOptionalArrayOfStrings: [String]?
var anOptionalOfOptionalStrings: [String?]?

var reading1: Float?
var reading2: Float?
var reading3: Float?

reading1 = 9.8
reading2 = 9.2
reading3 = 9.7

if let r1 = reading1, let r2  = reading2, let r3 = reading3 {
    let avgReading = (r1 + r2 + r3) / 3
    print(avgReading)
} else {
    let errorString = "Instrument reported a reading that was nil"
    print(errorString)
}

// Subscripting dictionaries
//let space13Assignee: String? = nameByParkingSpace[13]

if let space13Assignee = nameByParkingSpace[13] {
    print(space13Assignee)
}

let space42Assignee: String? = nameByParkingSpace[42]


// Loops
let range = 0..<countingUp.count
for i in range {
    let string = countingUp[i]
    print(string)
}

for string in countingUp {
    print(string)
}

for (i, string) in countingUp.enumerated() {
    print("\(i): \(string)")
}

for (space, name) in nameByParkingSpace {
    let permit = "Space\(space): \(name)"
    print(permit)
}

// Enumerations
enum PieType: Int {
    case apple = 0
    case cherry
    case pecan
}

let favoritePie = PieType.apple

let name: String
switch favoritePie {
case .apple:
    name = "Apple"
case .cherry:
    name = "Cherry"
case .pecan:
    name = "Pecan"
}

let macOSVersion : Int = 16
switch macOSVersion {
case 0...8:
    print("A big cat")
case 9...15:
    print("California locations")
default:
    print("Greetings, people of the future! What's new in 10.\(macOSVersion)?")
}

// Enumerations and raw values
let pieRawValue = PieType.pecan.rawValue
if let pieType = PieType(rawValue: pieRawValue) {
    // Got a valid 'pietype'
    print(pieType)
}

// Closures

