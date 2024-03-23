import UIKit


var greeting = "Hello, playground"

var name = "Ted"
name = "Rebecca"

let actor = "Tom Cruise"

// Closures
let sayHello = { (name: String) -> String in
    "Hi, \(name)!"
}

sayHello("Ron")

let team = ["Gloria", "Suzie", "Tiffany", "Tasha"]

let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")   //everything after in is body of closure
})

//String Interpolation
// put backslash \ and the variable or constant in parentheses
var s = "string interpolation"
print("This is a \(s)!")

// Trailing closure (remove opening/closing parentheses)
let onlyT2 = team.filter { $0.hasPrefix("T")}   //filter must recieve 1 string and return bool so can remove them
print(onlyT2)

//Struct - allows you to make your own datatypes with their own properties and methods
struct Album {
    let title: String
    let artist: String
    var isReleased = true
    
    func printSummary() {
        print("\(title) by \(artist)")
    }
}

// Optional Chaining - reads optionals inside optionals
let names = ["Arya", "Bran", "Robb", "Sansa"]
let chosen = names.randomElement()?.uppercased()
print("Next in line: \(chosen ?? "No one")")

"""
//How to get input from user:
print("Please enter number 1")
var num1 = Int(readLine()!)!
print("Please enter number 2")
var num2 = Int(readLine()!)!

var sum = num1 + num2
print("The sum of (num1) and (num2) is (sum)" )
"""
