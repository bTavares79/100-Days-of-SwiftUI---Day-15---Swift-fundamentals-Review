import UIKit

// Var can be freely in the code using Var when declaring the variable
var name = "Ted"

// Let is considered a constant in Swift. It can't be changed once the value has been given
let user = "Daphne"


// To have quotes inside a string use \\ inbetween the string
let quote = "He tapped a sign saying \"Believe\" and walked away"

// Strings that span multiple lines need triple quotes
let movie = """
A day in
the life
of an Apple
Engineer
"""

// This is a double type
let score = 3.1



// An array of strings
var colors = ["Red", "Green", "Blue"]
var numbers = [1, 2, 3, 4]
var readings = [0.1, 0.2, 0.3]

print(colors[0])
print(numbers[1])


// Arrays have many useful functions that can be called on an array
print(colors.contains("Octarines"))



// Dictinary
let worker = [
    "name": "Bil",
    "age": "44"
    
]

// When quering a dictionary it is a good idea to use a default if the value isn't there.
print(worker["name", default: "Unknown"])


// Sets are close to arrays but can't have duplicate values
// The return will be random and not in order.
var someNumber = Set([1, 20, 3, 4, 5])
print(someNumber)


// Ternary conditional operator
let age = 19
let canVote = age >= 18 ? "Yes" : "No"
print(canVote)



// For loops
let files = ["me.jpg", "work.txt", "sophie.jpg"]


// The continue keyword just skips that iteration of the loop
// This code will skip printing to the console the work.txt filename
for file in files {
    if file.hasSuffix(".jpg") == false {
        continue
    }
    
    print("Found picture \(file)")
}



// Handling function errors
enum PasswordError: Error {
    case short,
    obvious
}

func checkPassword(_ password: String) throws -> String {
    if password.count < 5 {
        throw PasswordError.short
    }
    
    if password == "12345" {
        throw PasswordError.obvious
    }
    
    if password.count < 10 {
        return "Ok"
    } else {
        return  "Good"
    }
}


do {
    let result = try checkPassword("12345")
    print("Rating: \(result)")
} catch PasswordError.obvious{
    print("Password is too obvious")
} catch {
    print("There was an error")
}

// Closures
let team = ["Gloria", "Suzanne", "Tiffany", "Tasha"]

// This fucntion on an array .filter has the ability to add a closure. This is used
// to filter to each item of the array and perform some logic on the array and return
// the results to another array
// In this example loop through the entire array and return the array elements that
// Start with a captial T
let onlyT = team.filter({ (name: String) -> Bool in
    return name.hasPrefix("T")
})

// There is a shorthand version of this which is a semi standard for $0
// The () need to be removed for a bracket
let onlyS = team.filter{$0.hasPrefix("S")}

print(onlyT)
print(onlyS)


// Property observers
// These allow you to run some code when a property is changed
struct Game {
    var score = 0 {
        didSet {
            print("Score is now \(score)")
        }
    }
}

var game = Game()
game.score += 10
game.score -= 3



let guests = ["Mario", "Luigi", "Peach"]

if !guests.isEmpty == true {
    print("This array has data in it")
}



// Optionals. This is how to deal with nil conditions like below
// Since the dictionary of opposites doesn't have a key for Peach
// nil is returned
let opposites = [
    "Mario": "Wario",
    "Luigi": "Waluigi"
]

let peachOpposites = opposites["Peach"]
//print(peachOpposites)

// This is called unwrapping optionals
if let marioOpposite = opposites["Mario"] {
    print("Mario's opposite is \(marioOpposite)")
}


// nil coalessing opertors this is the use of ??
let tvShows = ["Archer", "Babylon 5", "Ted lasso"]

//let favorite = tvShows.randomElement() ?? "None"
// This unwraps the tvShows array
var favorite = tvShows.randomElement() ?? "None"
print(favorite)

